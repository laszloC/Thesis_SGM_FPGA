#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "sad.h"

using namespace cv;

int main() {
	Mat img_left = imread("E:/test/rsz_im2.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_right = imread("E:/test/rsz_im6.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_cost(IMG_SIZE, MAX_DISP, CV_32SC1);

	sad_cost((uint8_t*)img_left.data, (uint8_t*)img_right.data, (int32_t*)img_cost.data, -1);

	FileStorage file("E:/test/rsz_cost.ext", FileStorage::WRITE);
	file << "cost" << img_cost;
//	file.release();

//	imwrite("E:/test/rsz_cost.tiff", img_cost);

	return 0;
}
