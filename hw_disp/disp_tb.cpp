#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "disp.h"

using namespace cv;

void scale(uint8_t* img, uint8_t in_start, uint8_t in_end, uint8_t out_start, uint8_t out_end, int32_t size)
{
	for (int32_t p = 0; p < size; p++) {
		img[p] = out_start + ((out_end - out_start) / (in_end - in_start)) * (img[p] - in_start);
	}
}

int main()
{
	Mat cost(IMG_SIZE, MAX_DISP, CV_32SC1);

	Mat cost_aggr(IMG_SIZE, MAX_DISP, CV_32SC1);


	FileStorage cost_file("E:/test/rsz_cost.ext", FileStorage::READ);
	cost_file["cost"] >> cost;
	cost_file.release();

	FileStorage aggr_file("E:/test/aggregated.ext", FileStorage::READ);
	aggr_file["cost"] >> cost_aggr;
	aggr_file.release();

	Mat disp_mat_orig(IMG_ROWS, IMG_COLS, CV_8UC1);

	Mat disp_mat_aggr(IMG_ROWS, IMG_COLS, CV_8UC1);

	disp((int32_t*)cost.data, (uint8_t*)disp_mat_orig.data);

	disp((int32_t*)cost_aggr.data, (uint8_t*)disp_mat_aggr.data);

	scale(disp_mat_orig.data, 0, MAX_DISP - 1, 0, 255, IMG_SIZE);

	scale(disp_mat_aggr.data, 0, MAX_DISP - 1, 0, 255, IMG_SIZE);

	namedWindow("unaggregated");
	imshow("unaggregated", disp_mat_orig);

	namedWindow("aggregated");
	imshow("aggregated", disp_mat_aggr);

	waitKey(0);

	return 0;
}
