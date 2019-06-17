#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "inv.h"

using namespace cv;

int main() {

	Mat img_in = imread("E:/test/rsz_im6.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_out(img_in.rows, img_in.cols, CV_8UC1);

	uint32_t size = img_in.rows * img_in.cols;

	inverse_img((uint8_t*)img_in.data, (uint8_t*)img_out.data);

	namedWindow("test");
	imshow("test", img_out);
	waitKey(0);

	return 0;
}
