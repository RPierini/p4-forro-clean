table tbl_forro_ig0 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i0_qr0;
        i0_qr2;
        i0_qr4;
        i0_qr6;
        i0_init(K0, K1, K2, K3, K4, K5, K6, K7, N0 + K3, N1);
        i0_cipher;
        drop;
    }
    size = 30;
    default_action = drop;
}

table tbl_forro_ig1 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i1_qr0;
        i1_qr2;
        i1_qr4;
        i1_qr6;
    }
    size = 28;
    default_action = i1_qr0;
}

table tbl_forro_ig2 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i2_qr0;
        i2_qr2;
        i2_qr4;
        i2_qr6;
    }
    size = 28;
    default_action = i2_qr0;
}

table tbl_forro_ig3 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i3_qr0;
        i3_qr2;
        i3_qr4;
        i3_qr6;
    }
    size = 28;
    default_action = i3_qr0;
}

table tbl_forro_ig4 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i4_qr0;
        i4_qr2;
        i4_qr4;
        i4_qr6;
    }
    size = 28;
    default_action = i4_qr0;
}

table tbl_forro_ig5 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i5_qr0;
        i5_qr2;
        i5_qr4;
        i5_qr6;
    }
    size = 28;
    default_action = i5_qr0;
}

table tbl_forro_ig6 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i6_qr0;
        i6_qr2;
        i6_qr4;
        i6_qr6;
    }
    size = 28;
    default_action = i6_qr0;
}

table tbl_forro_ig7 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i7_qr0;
        i7_qr2;
        i7_qr4;
        i7_qr6;
    }
    size = 28;
    default_action = i7_qr0;
}

table tbl_forro_ig8 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i8_qr0;
        i8_qr2;
        i8_qr4;
        i8_qr6;
    }
    size = 28;
    default_action = i8_qr0;
}

table tbl_forro_ig9 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i9_qr0;
        i9_qr2;
        i9_qr4;
        i9_qr6;
    }
    size = 28;
    default_action = i9_qr0;
}

table tbl_forro_ig10 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i10_qr0;
        i10_qr2;
        i10_qr4;
        i10_qr6;
    }
    size = 28;
    default_action = i10_qr0;
}

table tbl_forro_ig11 {
    key = {
        meta.rodada: exact;
    }
    actions = {
        i11_qr0;
        i11_qr2;
        i11_qr4;
        i11_qr6;
    }
    size = 28;
    default_action = i11_qr0;
}