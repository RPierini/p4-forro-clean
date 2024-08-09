action e0_qr1() {
   hdr.forro_state.v13 = hdr.forro_state.v13 + hdr.forro_state.v0;
}

action e1_qr1() {
   hdr.forro_state.v9 = hdr.forro_state.v9 ^ hdr.forro_state.v13;
}

action e2_qr1() {
   hdr.forro_state.v5 = hdr.forro_state.v5 + hdr.forro_state.v9;
}

action e3_qr1() {
   hdr.forro_state.v5 = hdr.forro_state.v5[21:0] ++ hdr.forro_state.v5[31:22];
}

action e4_qr1() {
   hdr.forro_state.v1 = hdr.forro_state.v1 + hdr.forro_state.v5;
}

action e5_qr1() {
   hdr.forro_state.v0 = hdr.forro_state.v0 ^ hdr.forro_state.v1;
}

action e6_qr1() {
   hdr.forro_state.v13 = hdr.forro_state.v13 + hdr.forro_state.v0;
}

action e7_qr1() {
   hdr.forro_state.v13 = hdr.forro_state.v13[4:0] ++ hdr.forro_state.v13[31:5];
}

action e8_qr1() {
   hdr.forro_state.v9 = hdr.forro_state.v9 + hdr.forro_state.v13;
}

action e9_qr1() {
   hdr.forro_state.v5 = hdr.forro_state.v5 ^ hdr.forro_state.v9;
}

action e10_qr1() {
   hdr.forro_state.v1 = hdr.forro_state.v1 + hdr.forro_state.v5;
}

action e11_qr1() {
   hdr.forro_state.v1 = hdr.forro_state.v1[23:0] ++ hdr.forro_state.v1[31:24];

   hdr.forro_rodada.rodada = hdr.forro_rodada.rodada + 1;
}