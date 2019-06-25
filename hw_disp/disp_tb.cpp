#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "disp.h"

using namespace cv;

void scale(img_t* img, img_t in_start, img_t in_end, img_t out_start, img_t out_end, index_t size)
{
	for (index_t p = 0; p < size; p++) {
		img[p] = out_start + ((out_end - out_start) / (in_end - in_start)) * (img[p] - in_start);
	}
}

int main()
{
	Mat cost(COST_ROWS, COST_COLS, CV_16SC1);

	FileStorage cost_file("E:/test/perf_an_test/cones_320x240/dm_cones_320x240.ext", FileStorage::READ);
	cost_file["cost"] >> cost;
	cost_file.release();

	Mat disp_mat_orig(IMG_ROWS, IMG_COLS, CV_8UC1);

	Mat cost_trans = cost.t();

	std::cout << "cost size: " << cost.rows << " x " << cost.cols << std::endl;
	std::cout << "cost_trans size: " << cost_trans.rows << " x " << cost_trans.cols << std::endl;

	for (int i = 0; i < IMG_ROWS; i++) {
		disp((cost_t*)cost_trans.data + i * IMG_COLS * MAX_DISP, (img_t*)disp_mat_orig.data + IMG_COLS * i);
	}

	scale(disp_mat_orig.data, 0, MAX_DISP - 1, 0, 255, IMG_SIZE);

	namedWindow("unaggregated");
	imshow("unaggregated", disp_mat_orig);

	waitKey(0);

	return 0;
}
