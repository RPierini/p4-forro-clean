/* -*- P4_16 -*- */

/*************************************************************************
 ****************  E G R E S S   P R O C E S S I N G   *******************
 *************************************************************************/

    /***********************  H E A D E R S  ************************/

struct my_egress_headers_t {
    ethernet_h              ethernet;
    forro_rodada_t          forro_rodada;
    forro_state_t           forro_state;
    forro_state_cipher_t    forro_cipher;
    forro_payload_t         forro_payload;
}

    /********  G L O B A L   E G R E S S   M E T A D A T A  *********/

struct my_egress_metadata_t {
    bit<8>  rodada;
    hashword_t key3;
}

    /***********************  P A R S E R  **************************/

   #include "eg_parser.p4"

    /***************** M A T C H - A C T I O N  *********************/

control Egress(
    /* User */
    inout my_egress_headers_t                          hdr,
    inout my_egress_metadata_t                         meta,
    /* Intrinsic */
    in    egress_intrinsic_metadata_t                  eg_intr_md,
    in    egress_intrinsic_metadata_from_parser_t      eg_prsr_md,
    inout egress_intrinsic_metadata_for_deparser_t     eg_dprsr_md,
    inout egress_intrinsic_metadata_for_output_port_t  eg_oport_md)
{
    Hash<bit<32>>(HashAlgorithm_t.IDENTITY) copy32_0;
    #include "includes/act_forro_eg_qr1.p4"
    #include "includes/act_forro_eg_qr3.p4"
    #include "includes/act_forro_eg_qr5.p4"
    #include "includes/act_forro_eg_qr7.p4"
    #include "includes/tbl_forro_eg.p4"

    apply {
        tbl_forro_eg0.apply();
        tbl_forro_eg1.apply();
        tbl_forro_eg2.apply();
        tbl_forro_eg3.apply();
        tbl_forro_eg4.apply();
        tbl_forro_eg5.apply();
        tbl_forro_eg6.apply();
        tbl_forro_eg7.apply();
        tbl_forro_eg8.apply();
        tbl_forro_eg9.apply();
        tbl_forro_eg10.apply();
        tbl_forro_eg11.apply();
    }
}

    /*********************  D E P A R S E R  ************************/

control EgressDeparser(packet_out pkt,
    /* User */
    inout my_egress_headers_t                       hdr,
    in    my_egress_metadata_t                      meta,
    /* Intrinsic */
    in    egress_intrinsic_metadata_for_deparser_t  eg_dprsr_md)
{
    apply {
        pkt.emit(hdr);
    }
}

