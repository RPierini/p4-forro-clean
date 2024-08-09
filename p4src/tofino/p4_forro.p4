/* -*- P4_16 -*- */

#include <core.p4>
#include <tna.p4>

const PortId_t CPU_PORT = 64;

//consts Forro
typedef bit<32>  hashword_t;
const hashword_t C0 = 0x746c6f76;
const hashword_t C1 = 0x61616461;
const hashword_t C2 = 0x72626173;
const hashword_t C3 = 0x61636e61;
const hashword_t T0 = 0x00000000;
const hashword_t T1 = 0x00000000;
const hashword_t K0 = 0x10101010;
const hashword_t K1 = 0x10101010;
const hashword_t K2 = 0x10101010;
const hashword_t K3 = 0x10101010;
const hashword_t K4 = 0x10101010;
const hashword_t K5 = 0x10101010;
const hashword_t K6 = 0x10101010;
const hashword_t K7 = 0x10101010;
const hashword_t N0 = 0x10101010;
const hashword_t N1 = 0x10101010;

/*************************************************************************
 ************* A S S E M B L I N G   T H E   P R O G R A M ***************
 *************************************************************************/
#include "../common/types.p4"
#include "../common/headers.p4"
#include "../common/ingress.p4"
#include "../common/egress.p4"
#include "../common/package.p4"
