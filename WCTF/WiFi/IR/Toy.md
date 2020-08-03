```
import irtoy
import serial


serial_device = serial.Serial('/dev/ttyACM0')
toy = irtoy.IrToy(serial_device)

c = toy.receive()

print(c)

# toy.transmit(c)


# [1, 170, 0, 209, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 76, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 23, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 76, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 23, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 23, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 0, 76, 0, 29, 7, 48, 1, 170, 0, 103, 0, 29, 17, 144, 1, 170, 0, 103, 0, 29, 255, 255]


# >>> dir(toy)
# ['__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_getTransmitReport', '_setSamplingMode', '_setTransmit', '_sleep', '_writeList', 'byteCount', 'complete', 'firmware_revision', 'handshake', 'protocolVersion', 'receive', 'requiredVersion', 'reset', 'sleepTime', 'toy', 'transmit', 'transmitMode']

# >>> toy.firmware_revision()
# (2, 22)

# >>> toy.protocolVersion
# b'S01'

# >>> toy.requiredVersion
# 22

# >>> toy.sleepTime
# 0.05

# >>> toy.toy
# Serial<id=0x71d0d5bb9748, open=True>(port='/dev/ttyACM0', baudrate=9600, bytesize=8, parity='N', stopbits=1, timeout=None, xonxoff=False, rtscts=False, dsrdtr=False)

```
