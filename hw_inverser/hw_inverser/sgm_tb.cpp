#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "sgm.h"

using namespace cv;

int main() {
	Mat img_left = imread("E:/test/rsz_img2.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_right = imread("E:/test/rsz_im6.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_dm(img_left.rows, img_left.cols, CV_8UC1);

	comp_d_map(img_left.data, img_right.data, img_dm.data);

	namedWindow("test");
	imshow("test", img_dm);
	waitKey(0);

	return 0;
}
