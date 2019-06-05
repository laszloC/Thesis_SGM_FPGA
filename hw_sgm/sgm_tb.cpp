#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "sgm.h"

using namespace cv;

int main() {
	Mat img_left = imread("E:/test/rsz_im2.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_right = imread("E:/test/rsz_im6.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_dm(IMG_ROWS, IMG_COLS, CV_8UC1);
	Mat img_cost(IMG_SIZE, MAX_DISP, CV_32SC1);

	comp_d_map((uint8_t*)img_left.data, (uint8_t*)img_right.data, (uint8_t*)img_dm.data, (int32_t*)img_cost.data);

	namedWindow("test");
	imshow("test", img_dm);
	waitKey(0);

	return 0;
}
