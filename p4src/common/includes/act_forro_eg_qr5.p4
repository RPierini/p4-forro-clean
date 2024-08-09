action e0_qr5() {
   hdr.forro_state.v12 = hdr.forro_state.v12 + hdr.forro_state.v0;
}

action e1_qr5() {
   hdr.forro_state.v11 = hdr.forro_state.v11 ^ hdr.forro_state.v12;
}

action e2_qr5() {
   hdr.forro_state.v6 = hdr.forro_state.v6 + hdr.forro_state.v11;
}

action e3_qr5() {
   hdr.forro_state.v6 = hdr.forro_state.v6[21:0] ++ hdr.forro_state.v6[31:22];
}

action e4_qr5() {
   hdr.forro_state.v1 = hdr.forro_state.v1 + hdr.forro_state.v6;
}

action e5_qr5() {
   hdr.forro_state.v0 = hdr.forro_state.v0 ^ hdr.forro_state.v1;
}

action e6_qr5() {
   hdr.forro_state.v12 = hdr.forro_state.v12 + hdr.forro_state.v0;
}

action e7_qr5() {
   hdr.forro_state.v12 = hdr.forro_state.v12[4:0] ++ hdr.forro_state.v12[31:5];
}

action e8_qr5() {
   hdr.forro_state.v11 = hdr.forro_state.v11 + hdr.forro_state.v12;
}

action e9_qr5() {
   hdr.forro_state.v6 = hdr.forro_state.v6 ^ hdr.forro_state.v11;
}

action e10_qr5() {
   hdr.forro_state.v1 = hdr.forro_state.v1 + hdr.forro_state.v6;
}

action e11_qr5() {
   hdr.forro_state.v1 = hdr.forro_state.v1[23:0] ++ hdr.forro_state.v1[31:24];

   hdr.forro_rodada.rodada = hdr.forro_rodada.rodada + 1;
}