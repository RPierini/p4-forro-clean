#!/usr/bin/env python3
import random
import socket
import sys
import binascii
import struct

from scapy.all import IP, UDP, Ether, get_if_hwaddr, get_if_list, sendp

from forro_class import ForroState, ForroPayload

#Inverte o Endianess
def swap32(valor):
    chunks_invertidos = []
    for i in range(0, len(valor), 4):
        chunk = valor[i:i+4]
        chunk_invertido = chunk[::-1]
        chunks_invertidos.append(chunk_invertido)

    return b''.join(chunks_invertidos)
        

def get_if():
    ifs=get_if_list()
    iface=None # "h1-eth0"
    for i in get_if_list():
        if "eth" in i:
            iface=i
            break;
    if not iface:
        print("Cannot find eth0 interface")
        exit(1)
    return iface

def padding(msg, tamanho):
    #Limita o tamanho da mensagem a 64 caracteres, 512 bits
    comprimento_msg = tamanho if len(msg) > tamanho else len(msg)
    #Converte a mensagem para bytes encodando ela
    mensagem_bytes = msg[:comprimento_msg].encode("utf-8")
    #Calcula quantos zeros faltam para 512 bits e preenche o resto da string
    mensagem_com_pad = mensagem_bytes + b'\x00' * (tamanho - comprimento_msg)

    return mensagem_com_pad

def main():
    if len(sys.argv)<2:
        print('pass 4 arguments: destination "<nonce>" "<key>" "<message>"')
        exit(1)

    #Carregando argumentos, ja invertendo o Endianess do nonce, key e mensagem
    addr = socket.gethostbyname(sys.argv[1])
    payload = swap32(padding(sys.argv[2], 64))
    iface = get_if()
    
    print(payload)

    print("sending on interface %s to %s" % (iface, str(addr)))
    pkt =  Ether(src=get_if_hwaddr(iface), dst='08:00:00:00:01:02')
    pkt = pkt / payload
    sendp(pkt, iface=iface, verbose=False)


if __name__ == '__main__':
    main()
