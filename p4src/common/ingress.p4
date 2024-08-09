/* -*- P4_16 -*- */

/*************************************************************************
 **************  I N G R E S S   P R O C E S S I N G   *******************
 *************************************************************************/

    /***********************  H E A D E R S  ************************/

struct my_ingress_headers_t {
    ethernet_h              ethernet;
    forro_rodada_t          forro_rodada;
    forro_state_t           forro_state;
    forro_state_cipher_t    forro_cipher;
    forro_payload_t         forro_payload;
}

    /******  G L O B A L   I N G R E S S   M E T A D A T A  *********/

struct my_ingress_metadata_t {
    //Usado para balancear a recirculação entre as 2 portas de recirculação do Tofino
    bit<8>      rodada;
    bit<1>      bit_aleatorio;
}

    /***********************  P A R S E R  **************************/
    #include "ig_parser.p4"

    /***************** M A T C H - A C T I O N  *********************/

control Ingress(
    /* User */
    inout my_ingress_headers_t                       hdr,
    inout my_ingress_metadata_t                      meta,
    /* Intrinsic */
    in    ingress_intrinsic_metadata_t               ig_intr_md,
    in    ingress_intrinsic_metadata_from_parser_t   ig_prsr_md,
    inout ingress_intrinsic_metadata_for_deparser_t  ig_dprsr_md,
    inout ingress_intrinsic_metadata_for_tm_t        ig_tm_md)
{
    #include "includes/act_uteis.p4"
    #include "includes/act_forro_ig_qr0.p4"
    #include "includes/act_forro_ig_qr2.p4"
    #include "includes/act_forro_ig_qr4.p4"
    #include "includes/act_forro_ig_qr6.p4"
    #include "includes/tbl_forro_ig.p4"

    apply {
        tbl_forro_ig0.apply();
        tbl_forro_ig1.apply();
        tbl_forro_ig2.apply();
        tbl_forro_ig3.apply();
        tbl_forro_ig4.apply();
        tbl_forro_ig5.apply();
        tbl_forro_ig6.apply();
        tbl_forro_ig7.apply();
        tbl_forro_ig8.apply();
        tbl_forro_ig9.apply();
        tbl_forro_ig10.apply();
        tbl_forro_ig11.apply();
    }
}


    /*********************  D E P A R S E R  ************************/

control IngressDeparser(packet_out pkt,
    /* User */
    inout my_ingress_headers_t                       hdr,
    in    my_ingress_metadata_t                      meta,
    /* Intrinsic */
    in    ingress_intrinsic_metadata_for_deparser_t  ig_dprsr_md)
{
    apply {
        pkt.emit(hdr);
    }
}

