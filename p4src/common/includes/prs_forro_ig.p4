state parse_forro_rodada {
    pkt.extract(hdr.forro_rodada);
    meta.rodada = hdr.forro_rodada.rodada;
    transition select(meta.rodada) {
        57: parse_forro_cipher;
        default: parse_forro_state;
    }
}

state parse_forro_cipher {
    pkt.extract(hdr.forro_cipher);
    pkt.extract(hdr.forro_payload);
    transition accept;
}

state parse_forro_state {
    pkt.extract(hdr.forro_state);
    transition accept;
}

state parse_forro_payload {
    pkt.extract(hdr.forro_payload);
    transition accept;
}