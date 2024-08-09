#Adaptado do P4-MD5
from scapy.all import Packet, XBitField
class ForroState(Packet):
    name = "Forro State Values"
    fields_desc=[ XBitField("rodada", None, 8),
                  XBitField("v0", None, 32),
                  XBitField("v1", None, 32),
                  XBitField("v2", None, 32),
                  XBitField("v3", None, 32),
                  XBitField("v4", None, 32),
                  XBitField("v5", None, 32),
                  XBitField("v6", None, 32),
                  XBitField("v7", None, 32),
                  XBitField("v8", None, 32),
                  XBitField("v9", None, 32),
                  XBitField("v10", None, 32),
                  XBitField("v11", None, 32),
                  XBitField("v12", None, 32),
                  XBitField("v13", None, 32),
                  XBitField("v14", None, 32),
                  XBitField("v15", None, 32)]

class ForroPayload(Packet):
    name = "Forro PAYLOAD Values"
    fields_desc=[ XBitField("d0", None, 32),
                  XBitField("d1", None, 32),
                  XBitField("d2", None, 32),
                  XBitField("d3", None, 32),
                  XBitField("d4", None, 32),
                  XBitField("d5", None, 32),
                  XBitField("d6", None, 32),
                  XBitField("d7", None, 32),
                  XBitField("d8", None, 32),
                  XBitField("d9", None, 32),
                  XBitField("d10", None, 32),
                  XBitField("d11", None, 32),
                  XBitField("d12", None, 32),
                  XBitField("d13", None, 32),
                  XBitField("d14", None, 32),
                  XBitField("d15", None, 32)]