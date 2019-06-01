#ifndef HLS_DESIGN_META_H
#define HLS_DESIGN_META_H
#include "hls_design.h"

struct HLS_Design_Meta {
// port data: name, bitwidth, direction (enumerator: hls_in, hls_out, hls_inout), group.
static const Port_Property port_props[65];
static const HLS_INT32  latency = 676801;
static const HLS_INT32  II = 676802;
static const char*  dut_name;
static bool is_vld_port(HLS_UINT32);
};
#endif
