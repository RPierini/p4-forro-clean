header forro_rodada_t {
    bit<8>      rodada; //Numero da rodada (e QR) de processamento do state. 0 = init. 1 a 56 = QRs. 57 = cifracao
}

// k = chave, t = contador (sempre zero), c = constantes, v = nonce
header forro_state_t {
    hashword_t  v0; //k0
    hashword_t  v1; //k1
    hashword_t  v2; //k2
    hashword_t  v3; //k3
    hashword_t  v4; //t0
    hashword_t  v5; //t1
    hashword_t  v6; //c0
    hashword_t  v7; //c1
    hashword_t  v8; //k4
    hashword_t  v9; //k5
    hashword_t  v10; //k6
    hashword_t  v11; //k7
    hashword_t  v12; //v0
    hashword_t  v13; //v1
    hashword_t  v14; //c2
    hashword_t  v15; //c3
}

header forro_state_cipher_t {
    bit<128> linha0;
    bit<128> linha1;
    bit<128> linha2;
    bit<128> linha3;
}

header forro_payload_t {
    bit<128> linha0;
    bit<128> linha1;
    bit<128> linha2;
    bit<128> linha3;
}