action i0_qr4() {
   hdr.forro_state.v15 = hdr.forro_state.v15 + hdr.forro_state.v3;
}

action i1_qr4() {
   hdr.forro_state.v10 = hdr.forro_state.v10 ^ hdr.forro_state.v15;
}

action i2_qr4() {
   hdr.forro_state.v5 = hdr.forro_state.v5 + hdr.forro_state.v10;
}

action i3_qr4() {
   hdr.forro_state.v5 = hdr.forro_state.v5[21:0] ++ hdr.forro_state.v5[31:22];
}

action i4_qr4() {
   hdr.forro_state.v0 = hdr.forro_state.v0 + hdr.forro_state.v5;
}

action i5_qr4() {
   hdr.forro_state.v3 = hdr.forro_state.v3 ^ hdr.forro_state.v0;
}

action i6_qr4() {
   hdr.forro_state.v15 = hdr.forro_state.v15 + hdr.forro_state.v3;
}

action i7_qr4() {
   hdr.forro_state.v15 = hdr.forro_state.v15[4:0] ++ hdr.forro_state.v15[31:5];
}

action i8_qr4() {
   hdr.forro_state.v10 = hdr.forro_state.v10 + hdr.forro_state.v15;
}

action i9_qr4() {
   hdr.forro_state.v5 = hdr.forro_state.v5 ^ hdr.forro_state.v10;
}

action i10_qr4() {
   hdr.forro_state.v0 = hdr.forro_state.v0 + hdr.forro_state.v5;
}

action i11_qr4() {
   hdr.forro_state.v0 = hdr.forro_state.v0[23:0] ++ hdr.forro_state.v0[31:24];

   hdr.forro_rodada.rodada = hdr.forro_rodada.rodada + 1;
   ig_tm_md.ucast_egress_port=68;
}