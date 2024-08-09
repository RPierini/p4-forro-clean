parser IngressParser(packet_in        pkt,
    /* User */
    out my_ingress_headers_t          hdr,
    out my_ingress_metadata_t         meta,
    /* Intrinsic */
    out ingress_intrinsic_metadata_t  ig_intr_md)
{
    #include "includes/prs_forro_ig.p4"

    /* This is a mandatory state, required by Tofino Architecture */
    state start {
        pkt.extract(ig_intr_md);
        pkt.advance(PORT_METADATA_SIZE);
        transition parse_ethernet;
    }

    state parse_drop {
        meta.rodada = 0xFF;
        transition accept;
    }

    state parse_ethernet {
        pkt.extract(hdr.ethernet);
        meta.rodada = 0x0;
        transition select(hdr.ethernet.ether_type) {
            ether_type_t.FORRO:   parse_forro_rodada;
            ether_type_t.IPV6:    parse_drop;
            default: parse_forro_payload;
        }
    }
}