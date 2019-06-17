#ifndef __DISP_H__
#define __DISP_H__

#include "../hw_constants/constants.h"

#include <stdint.h>
//#include <ap_int.h>

#define COST_MAX 2147483647

void disp(int32_t* cost_in, uint8_t* disp_out);

#endif // __DISP_H__
