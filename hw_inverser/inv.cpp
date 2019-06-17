#include "inv.h"

void inverse_img(uint8_t img_in[IMG_SIZE], uint8_t img_out[IMG_SIZE])
{
#pragma HLS INTERFACE s_axilite port=return bundle=D_BUS
#pragma HLS INTERFACE m_axi depth=42300 port=img_in offset=slave bundle=D_BUS
#pragma HLS INTERFACE m_axi depth=42300 port=img_out offset=slave bundle=D_BUS

//	hls::Mat<IMG_ROWS, IMG_COLS, HLS_8UC1> src;
//	hls::Mat<IMG_ROWS, IMG_COLS, HLS_8UC1> dst;
//	hls::AXIM2Mat<IMG_COLS, uint8_t, IMG_ROWS, IMG_COLS, HLS_8UC1>(img_in, src);
//
//	for (int i = 0; i < IMG_ROWS; i++) {
//		for	(int j = 0; j < IMG_COLS; j++) {
//			uint8_t val = 255 - (uint8_t)src.read();
//			dst.write(val);
//		}
//	}
//
//	hls::Mat2AXIM<IMG_COLS, uint8_t, IMG_ROWS, IMG_COLS, HLS_8UC1>(dst, img_out);

#pragma HLS DATAFLOW
	for	(uint32_t i = 0; i < IMG_SIZE; i++) {
		img_out[i] = 255 - img_in[i];
	}
}
