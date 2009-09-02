import struct, socket

# Simple usage Example: WakeUp("AA:AA:AA:AA:AA:AA")
def WakeUp(mac_address):
    addr_byte = mac_address.split(':')
    hw_addr = struct.pack('BBBBBB', int(addr_byte[0], 16), int(addr_byte[1], 16), int(addr_byte[2], 16), int(addr_byte[3], 16), int(addr_byte[4], 16), int(addr_byte[5], 16))
    payload = '\xff' * 6 + hw_addr * 16
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    s.sendto(mac_address, ('<broadcast>', 9))
    s.close()


