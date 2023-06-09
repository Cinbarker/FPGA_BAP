""" Communcation process implementing protocol """
from math import ceil
import time
import threading
import multiprocessing
import serial
from bitstring import BitArray
import struct
import numpy as np

# from data_processing_functions import create_frequency_vector
from data_conversion import flatten, to_bytes, float_to_hex
from data_processing_functions import *

FP_SIZE = 16
FP_DATA_BYTES = ceil(FP_SIZE/8)
POLY_DIM = 10
EXTRA_DIM = 5
FREQ_DIM = 4

# Struct of commands
cmds = { "set_led": 0b01100001,
        "request_amplitude": 0b01100010,
        "param_frequencies": 0b01100011,
        "param_polynomial_features": 0b01100100,
        "param_extra_feature": 0b01100101,
        "param_magnitude_weights": 0b01100110,
        "param_phase_weights": 0b01100111,
        "param_phasor_magnitude": 0b01101000,
        "param_phasor_phase": 0b01101001,
        "param_model_id": 0b01101010,
        "update_model" : 0b01101001
        }

class Communication:
    # 2 bytes
    input_buffer_size = 2*8
    n_transmit_attempts = 10
    n_receive_attempts = 5

    start_byte = bytes([255])
    

    def __init__(self,
                 baud_rate, comport,        # Serial
                 mcu_ready, mcu_not_ready,  # mcu status flags
                 update_fpga_rx) -> None:   # pipe, receiveing from system control
        
        self.baud_rate = baud_rate
        self.comport = comport
        self.mcu_ready = mcu_ready
        self.mcu_not_ready = mcu_not_ready
        self.update_fpga_rx = update_fpga_rx

    def serial_begin(self):
        """ Create serial object and start serial com"""
         # Construct serial object
        try:
            self.mcu_serial = serial.Serial(self.comport, self.baud_rate)
        except :
            print("NO PORT")
            self.mcu_not_ready.set()
        
        # close and open (start)
        self.mcu_serial.close()
        self.mcu_serial.open()

    def handshake(self):
        """ Performs handshake at startup, if it fails exit program"""
        # Initialize receive byte, prevent reference before assignment
        receive_byte = bytes([0])

        # Skip if start up byte received
        if not self.mcu_ready.is_set():
            # Send start byte
            
            for transmit_attempt in range(Communication.n_transmit_attempts):
                # n attempts to transmit
                self.mcu_serial.write(Communication.start_byte)
                print("start byte attempt", transmit_attempt)

                for receive_attempt in range(Communication.n_receive_attempts):
                    # n attempts to receive
                    if self.mcu_serial.in_waiting>0:
                        receive_byte = self.mcu_serial.read(1)
                    print("receive attempt", receive_attempt)
                    time.sleep(0.1)

                    # If received break
                    if receive_byte == bytes([125]):
                        # Set mcu ready flag
                        print("RECEIVED")
                        self.mcu_ready.set()
                        break

                # Break out first loop
                if self.mcu_ready.is_set():
                    print("Received start byte")
                    break

            # If not received break out program
            if not self.mcu_ready.is_set():
                self.mcu_not_ready.set()

    def led_cmd(self):
        """ when "01100001" =>  -- CMD: RX_LED                  [ascii: a] --> on/off """
        # Toggle
        cmd = 97
        self.mcu_serial.write(bytes([cmd]))

    def amplitude(self): # Not used!
        """ when "01100010" =>  -- CMD: TX_AMPLITUDE            [ascii: b] -->"""
        cmd =  98#"b"
        self.mcu_serial.write(bytes([cmd])) #cmd.encode("utf-8")



    def frequencies(self, frequencies): # 4 Frequencies --> phase increase per sample (NOT NORMALIZED)
        """ when "01100011" =>  -- CMD: RX frequencies          [ascii: c] --> 4 bytes per frequency (tot 12 bytes)"""
        cmd = 99 #"c"
        self.mcu_serial.write(bytes([cmd]))
        
        phase_incr = []
        for frequency in frequencies:
            phase_incr.append((frequency*2**32)/(100e6))

        raw_data = [float_to_hex(a, FP_SIZE) for a in flatten(phase_incr)]
        byte_array = bytes([cmds['param_frequencies']] + flatten([to_bytes(i, 2) for i in raw_data]))
        self.mcu_serial.write(byte_array)

        # for frequency in frequencies:
        #     # Send frequency as 4 bytes (float --> 4 bytes)
        #     frequency_bytes = struct.pack('f', frequency)
        #     self.mcu_serial.write(frequency_bytes)
        
    def polynomial_features(self, frequencies, bandwidth): # [1, f , f^2 ....] NORMALIZED
        """ when "01100100" =>  -- CMD: RX polynomial_features  [ascii: d]  --> """
        # TEST cmd = 100 #"d"
        # Normalize frequencies and create vector [[1,f_norm, f_norm^2 ... f_norm^7], [...],[...],[..]]
        frequencies_vector_normalized = []
        for frequency in frequencies:
            frequencies_vector_normalized.append(create_feature_vector_normalized(frequency,bandwidth))
            

        raw_data = [float_to_hex(a, FP_SIZE) for a in flatten(frequencies_vector_normalized)]
        byte_array = bytes([cmds['param_polynomial_features']] + flatten([to_bytes(i, 2) for i in raw_data]))
        
        self.mcu_serial.write(byte_array)

    def extra_feature(self, power):
        """ when "01100101" =>  -- CMD: RX extra_feature        [ascii: e] --> 2 bytes """
        cmd = 101 #"e"

        self.mcu_serial.write(bytes([cmd])) # Send message typpe
        self.mcu_serial.write(bytes([power])) # Send content

    # TODO: cast to 2 bytes per weight
    def magnitude_weights(self, weights):
        """ when "01100110" =>  -- CMD: RX magnitude_weights    [ascii: f] --> 50 weights 2bytes per weight"""
        cmd = 102 #"f"
        self.mcu_serial.write(bytes([cmd]))
        self.mcu_serial.write(bytes(weights))

    def phasor_magnitude(self, magnitudes, ):
        """ when "01101000" =>  -- CMD: RX phasor_magnitude     [ascii: h] --> 2 bytes per magnitude (tot 6) """
        # cmd = 104 #"h"
        # Calculate X_hat (magnitude that is on the ultrasound input)
        X_hat_list = []
        for i, frequency_vector in enumerate(frequencies_vector_normalized):
            # multiply each element of power to the frequencies array
            print("FREQ vector", frequency_vector)
            product_list = [[power_element*frequency_element for frequency_element in frequency_vector]for power_element in power_vector_normalized]
            flattened_product_list = list(itertools.chain(*product_list))
            # print("PRODUCT", product_list)
            # print("PRODUCT FLATTEND ", flattened_product_list)
            # for j, power_element in enumerate(power_vector_normalized):
            #     product_list.append(power_element*frequency_vector)

            # weights*product list (as dot operation) should result in scalar
            product_arr = np.array(flattened_product_list)
            # print("SIZES", product_arr.shape, np.shape(product_list), product_list)
            abs_H = np.dot(current_model_params, product_arr)

            X_hat_list.append(amplitudes[i]/abs_H)
        self.mcu_serial.write(bytes([cmd]))
        self.mcu_serial.write(bytes(magnitudes)) # Send list of amplitudes as packets of bytes (total 6 bytes)

    def model_id(self, id):
        """ when "01101010" =>  -- CMD: RX model_id             [ascii: j] --> 2 bytes """
        cmd = 106 # "j"
        raw_data = [float_to_hex(a, FP_SIZE) for a in flatten(id)]
        byte_array = bytes([cmds["param_model_id"]] + flatten([to_bytes(i, 2) for i in raw_data]))

        # id_bytes = struct.pack('h', int(id*100))
        # self.mcu_serial.write(bytes([cmd]))
        # self.mcu_serial.write(id_bytes)

    def update_model(self):
        """ when "01101011" =>  -- CMD: Update Model            [ascii: k] """
        # cmd = 105 # "k"
        self.mcu_serial.write(bytes([cmds['update_model']]))

    # TODO: Communication with controller
    def calibrate_quadrature_point(self):
        """ Calibrate quadrature point """
        cmd = 103
        # Send q-point start command
        self.mcu_serial.write([cmd])

        # Wait for response
        # while
        # 

def handshake_thread_target(mcu_serial, mcu_not_ready, mcu_ready):
    """ Performs handshake at startup, if it fails exit program"""
    global input_buffer_size
    # Skip if start up byte received
    if not mcu_ready.is_set():
        # Send start byte
        n_transmit_attempts = 10
        n_receive_attempts = 5
        start_byte = bytes([255])
        receive_byte = 0
        for transmit_attempt in range(n_transmit_attempts):
            # n attempts to transmit
            mcu_serial.write(start_byte)
            print("start byte attempt", transmit_attempt)

            for receive_attempt in range(n_receive_attempts):
                # n attempts to receive
                if mcu_serial.in_waiting>0:
                    receive_byte = mcu_serial.read(1)
                print("receive attempt", receive_attempt)
                time.sleep(0.1)

                # If received break
                if receive_byte == bytes([125]):
                    # Set mcu ready flag
                    print("RECEIVED")
                    mcu_ready.set()
                    break

            # Break out first loop
            if mcu_ready.is_set():
                print("Received start byte")
                break

        # If not received break out program
        if not mcu_ready.is_set():
            mcu_not_ready.set()

def communication_thread_target(mcu_serial, mcu_ready):
    """ Implementation of transmit pattern:
    Each command contains 1 command byte followed by content, stop message with update model CMD
    when "01100001" =>  -- CMD: RX_LED                  [ascii: a] --> on/off
    when "01100010" =>  -- CMD: TX_AMPLITUDE            [ascii: b] -->
    when "01100011" =>  -- CMD: RX frequencies          [ascii: c] --> 4 bytes per frequency (tot 12 bytes)
    when "01100100" =>  -- CMD: RX polynomial_features  [ascii: d]  --> 
    when "01100101" =>  -- CMD: RX extra_feature        [ascii: e] --> 2 bytes
    when "01100110" =>  -- CMD: RX magnitude_weights    [ascii: f] --> 50 weights 2bytes per weight
    when "01100111" =>  -- CMD: RX phase_weights        [ascii: g] NOT USED
    when "01101000" =>  -- CMD: RX phasor_magnitude     [ascii: h] --> 2 bytes per magnitude (tot 6)
    when "01101001" =>  -- CMD: RX phasor_phase         [ascii: i] NOT USED
    when "01101010" =>  -- CMD: RX model_id             [ascii: j] --> 2 bytes
    when "01101011" =>  -- CMD: Update Model            [ascii: k]
    
    """
    # RX_LED =  
    mcu_ready.wait()
    RX_LED = ord('a')
    RX_PHASOR_MAGNITUDE = ord('h')
    MODEL_ID = ord('j')
    UPDATE_MODEL = ord('k')

    while True:
        print("A",RX_LED )
        time.sleep(1)
        # RX_LED
        mcu_serial.write(RX_LED)
        # TX_AMPLITUDE

        # RX frequencies

        # RX polynomial_features

        # RX extra_feature

        # RX magnitude_weights

        # RX phasor_magnitude
        mcu_serial.write(RX_PHASOR_MAGNITUDE)
        # RX model_id
        mcu_serial.write(MODEL_ID)
        # Update Model
        mcu_serial.write(UPDATE_MODEL)
        time.sleep(1)
        mcu_serial.write(RX_LED)


def communication_process_target(port, baud_rate, mcu_not_ready, mcu_ready,
                                 update_fpga_rx, bandwidth):
# Create communication
    mcu_communication = Communication(baud_rate,port,mcu_ready,mcu_not_ready, update_fpga_rx)

# Begin communication
    mcu_communication.serial_begin()

# Handshake
    mcu_communication.handshake()

    # Create threads
    # # Startup handshake
    # handshake_thread = threading.Thread(
    #     target=handshake_thread_target        ,
    #     args=(mcu_serial,mcu_not_ready, mcu_ready)
    # )
    # Communication handler
    # communication_thread = threading.Thread(
    #     target=communication_thread_target,
    #     args=(mcu_serial,mcu_ready)
    # )

# Start threads
    # handshake_thread.start()
    # communication_thread.start()

    while True:

        # If there is content in the pipe
        if update_fpga_rx.poll():
            content_to_send = update_fpga_rx.recv()
            print("UPDATE FPGA")
            # GEt id
            # TODO: Why 1:7
            model_id = content_to_send[0]
            # Get frequencies
            frequencies = content_to_send[1:7]
            # Get model params
            model_params = content_to_send[7:12]
            # Get amplitudes
            amplitudes = content_to_send[12:]

            # Test poly features 
            polynomial_features = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                       [2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
                       [3, 3, 3, 3, 3, 3, 3, 3, 3, 3]]
            # Send ID
            # mcu_communication.led_cmd()
            mcu_communication.polynomial_features(polynomial_features)
            # mcu_communication.model_id(model_id)
            # mcu_communication.frequencies(frequencies)
            # mcu_communication.magnitude_weights(model_params)
            # mcu_communication.phasor_magnitude(amplitudes)


            # # Send phasor magnitude
            # mcu_communication.phasor_magnitude(frequencies,model_params,amplitudes)
            # Send frequencies 
            
            # # Update
            mcu_communication.update_model()