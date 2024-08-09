action i0_init(
    in hashword_t key0, in hashword_t key1, in hashword_t key2, in hashword_t key3,
    in hashword_t key4, in hashword_t key5, in hashword_t key6, in hashword_t key7,
    in hashword_t n0_k3, in hashword_t n1)
    {
    hdr.forro_rodada.setValid();
    hdr.forro_state.setValid();

    hdr.forro_state.v0 = key0;
    hdr.forro_state.v1 = key1;
    hdr.forro_state.v2 = key2;
    hdr.forro_state.v3 = key3;
    hdr.forro_state.v4 = 0x0;
    hdr.forro_state.v5 = 0x0;
    hdr.forro_state.v6 = C0;
    hdr.forro_state.v7 = C1;
    hdr.forro_state.v8 = key4;
    hdr.forro_state.v9 = key5;
    hdr.forro_state.v10 = key6;
    hdr.forro_state.v11 = key7;
    hdr.forro_state.v12 = n0_k3; // adiantando passo 1 do qr0
    hdr.forro_state.v13 = n1;
    hdr.forro_state.v14 = C2;
    hdr.forro_state.v15 = C3;

    //incrementando uma rodada
    meta.rodada = 1;

    //Alterando Ethertype
    hdr.ethernet.ether_type = ether_type_t.FORRO;
}

action i0_cipher () {
   hdr.forro_payload.linha0 = hdr.forro_payload.linha0 ^ hdr.forro_cipher.linha0;
   hdr.forro_payload.linha1 = hdr.forro_payload.linha1 ^ hdr.forro_cipher.linha1;
   hdr.forro_payload.linha2 = hdr.forro_payload.linha2 ^ hdr.forro_cipher.linha2;
   hdr.forro_payload.linha3 = hdr.forro_payload.linha3 ^ hdr.forro_cipher.linha3;

   // Definindo porta de saida e pulando Egress
   ig_tm_md.ucast_egress_port = 0x1;
   ig_tm_md.bypass_egress = 0x1;

   // Limpando cabeçalhos de rodada e estado para saida
   hdr.forro_rodada.setInvalid();
   hdr.forro_cipher.setInvalid();
   exit;
}

action i0_qr0() {
   hdr.forro_state.v12 = hdr.forro_state.v12 + hdr.forro_state.v3;
}

action i1_qr0() {
   hdr.forro_state.v8 = hdr.forro_state.v8 ^ hdr.forro_state.v12;
}

action i2_qr0() {
   hdr.forro_state.v4 = hdr.forro_state.v4 + hdr.forro_state.v8;
}

action i3_qr0() {
   hdr.forro_state.v4 = hdr.forro_state.v4[21:0] ++ hdr.forro_state.v4[31:22];
}

action i4_qr0() {
   hdr.forro_state.v0 = hdr.forro_state.v0 + hdr.forro_state.v4;
}

action i5_qr0() {
   hdr.forro_state.v3 = hdr.forro_state.v3 ^ hdr.forro_state.v0;
}

action i6_qr0() {
   hdr.forro_state.v12 = hdr.forro_state.v12 + hdr.forro_state.v3;
}

action i7_qr0() {
   hdr.forro_state.v12 = hdr.forro_state.v12[4:0] ++ hdr.forro_state.v12[31:5];
}

action i8_qr0() {
   hdr.forro_state.v8 = hdr.forro_state.v8 + hdr.forro_state.v12;
}

action i9_qr0() {
   hdr.forro_state.v4 = hdr.forro_state.v4 ^ hdr.forro_state.v8;
}

action i10_qr0() {
   hdr.forro_state.v0 = hdr.forro_state.v0 + hdr.forro_state.v4;
}

action i11_qr0() {
   hdr.forro_state.v0 = hdr.forro_state.v0[23:0] ++ hdr.forro_state.v0[31:24];

   hdr.forro_rodada.rodada = meta.rodada + 1;
   ig_tm_md.ucast_egress_port=68;
}