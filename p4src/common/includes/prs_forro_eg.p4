state parse_forro_rodada {
    pkt.extract(hdr.forro_rodada);
    meta.rodada=hdr.forro_rodada.rodada;
    pkt.extract(hdr.forro_state);
    transition accept;
}