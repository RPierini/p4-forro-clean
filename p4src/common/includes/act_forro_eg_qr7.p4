action e0_qr7() {
   hdr.forro_state.v14 = hdr.forro_state.v14 + hdr.forro_state.v2;
}

action e1_qr7() {
   hdr.forro_state.v9 = hdr.forro_state.v9 ^ hdr.forro_state.v14;
}

action e2_qr7() {
   hdr.forro_state.v4 = hdr.forro_state.v4 + hdr.forro_state.v9;
}

action e3_qr7() {
   hdr.forro_state.v4 = hdr.forro_state.v4[21:0] ++ hdr.forro_state.v4[31:22];
}

action e4_qr7() {
   hdr.forro_state.v3 = hdr.forro_state.v3 + hdr.forro_state.v4;
}

action e5_qr7() {
   hdr.forro_state.v2 = hdr.forro_state.v2 ^ hdr.forro_state.v3;
}

action e6_qr7() {
   hdr.forro_state.v14 = hdr.forro_state.v14 + hdr.forro_state.v2;
}

action e7_qr7() {
   hdr.forro_state.v14 = hdr.forro_state.v14[4:0] ++ hdr.forro_state.v14[31:5];
}

action e8_qr7() {
   hdr.forro_state.v9 = hdr.forro_state.v9 + hdr.forro_state.v14;
}

action e9_qr7() {
   hdr.forro_state.v4 = hdr.forro_state.v4 ^ hdr.forro_state.v9;
}

action e10_qr7(in hashword_t key3) {
   hdr.forro_state.v3 = hdr.forro_state.v3 + hdr.forro_state.v4;

   meta.key3 = key3;
}

action e11_qr7() {
   hdr.forro_state.v3 = hdr.forro_state.v3[23:0] ++ hdr.forro_state.v3[31:24];
   hdr.forro_rodada.rodada = hdr.forro_rodada.rodada + 1;
}

action e11_qr7_fin(in hashword_t key0, in hashword_t key1, in hashword_t key2, in hashword_t key3,
    in hashword_t key4, in hashword_t key5, in hashword_t key6, in hashword_t key7,
    in hashword_t n0, in hashword_t n1)
   {
   hdr.forro_state.v0 = hdr.forro_state.v0 + key0;
   hdr.forro_state.v1 = hdr.forro_state.v1 + key1;
   hdr.forro_state.v2 = hdr.forro_state.v2 + key2;
   hdr.forro_state.v3 = copy32_0.get(hdr.forro_state.v3[23:0] ++ hdr.forro_state.v3[31:24]) + meta.key3; //Shift + Add
   hdr.forro_state.v4 = hdr.forro_state.v4 + 0x0;
   hdr.forro_state.v5 = hdr.forro_state.v5 + 0x0;
   hdr.forro_state.v6 = hdr.forro_state.v6 + C0;
   hdr.forro_state.v7 = hdr.forro_state.v7 + C1;
   hdr.forro_state.v8 = hdr.forro_state.v8 + key4;
   hdr.forro_state.v9 = hdr.forro_state.v9 + key5;
   hdr.forro_state.v10 = hdr.forro_state.v10 + key6;
   hdr.forro_state.v11 = hdr.forro_state.v11 + key7;
   hdr.forro_state.v12 = hdr.forro_state.v12 + n0;
   hdr.forro_state.v13 = hdr.forro_state.v13 + n1;
   hdr.forro_state.v14 = hdr.forro_state.v14 + C2;
   hdr.forro_state.v15 = hdr.forro_state.v15 + C3;
   
   hdr.forro_rodada.rodada = hdr.forro_rodada.rodada + 1;
}