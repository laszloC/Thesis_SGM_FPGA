#ifndef __TYPES_H__
#define __TYPES_H__

#include <stdint.h>
#include <ap_int.h>

 typedef uint8_t img_t;
//typedef ap_uint<8> img_t;
 typedef int16_t cost_t;
//typedef ap_int<32> cost_t;
typedef int     index_t;

// #define COST_WIDTH_1 31
#define COST_WIDTH_1 15

#endif //__TYPES_H
