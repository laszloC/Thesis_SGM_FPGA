/*
 * stereo.h
 *
 *  Created on: Jun 12, 2019
 *      Author: laszl
 */

#ifndef SRC_STEREO_STEREO_H_
#define SRC_STEREO_STEREO_H_

#include "xil_types.h"

int init_stereo();

int compute_disparity(u8* left, u8* right, u8* disp, u32* size, u32 max_disp);

int uninit_stereo();

#endif /* SRC_STEREO_STEREO_H_ */
