from typing import ByteString
import serial
import time

serial_port = serial.Serial(port="COM3", baudrate=9600, bytesize=8, stopbits=serial.STOPBITS_ONE)

tools.list_ports.comports()