/*
 * common.c
 *
 *  Created on: Jun 12, 2019
 *      Author: laszl
 */

#include "common.h"

void scale(u8* img, u32 size, u8 in_start, u8 in_end, u8 out_start, u8 out_end)
{
	for (u32 p = 0; p < size; p++) {
		img[p] = out_start + ((out_end - out_start) / (in_end - in_start)) * (img[p] - in_start);
	}
}
