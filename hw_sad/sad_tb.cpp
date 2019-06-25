#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "sad.h"

using namespace cv;

int main() {
	Mat img_left = imread("E:/test/perf_an_test/cones_320x240/cones_l_320x240.bmp", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_right = imread("E:/test/perf_an_test/cones_320x240/cones_r_320x240.bmp", CV_LOAD_IMAGE_GRAYSCALE);
	Mat img_cost(MAX_DISP, IMG_SIZE, CV_16SC1);

	img_t rows_left[BLOCK_SIZE];
	img_t rows_right[BLOCK_SIZE];

	for (int i = 0; i < IMG_ROWS; ++i) {
		for	(int d = 0; d < MAX_DISP; d++) {

			// create blocks
			for (int bi = 0; bi < BLOCK_ROWS; bi++) {
				for (int bj = 0; bj < BLOCK_COLS; bj++) {
					int li = i - 2 + bi, lj = bj - 2;
					int ri = i - 2 + bi, rj = lj - d;

					if (li < 0 || lj < 0 || li >= IMG_ROWS || lj >= IMG_COLS) {
						rows_left[BLOCK_INDEX(bi, bj)] = 0;
					}
					else {
						rows_left[BLOCK_INDEX(bi, bj)] = (img_t)img_left.at<uchar>(li, lj);
					}

					if (ri < 0 || rj < 0 || ri >= IMG_ROWS || rj >= IMG_COLS) {
						rows_right[BLOCK_INDEX(bi, bj)] = 0;
					}
					else {
						rows_right[BLOCK_INDEX(bi, bj)] = (img_t)img_right.at<uchar>(ri, rj);
					}
				}
			}
			// create blocks done

			cost_t* cost_block = (cost_t*)(img_cost.data) + (d * IMG_SIZE + (i * IMG_COLS));
			sad_cost(rows_left, rows_right, cost_block);

		}
	}

	FileStorage file("E:/test/perf_an_test/cones_320x240/dm_cones_320x240.ext", FileStorage::WRITE);
	file << "cost" << img_cost;
//	file.release();

//	imwrite("E:/test/rsz_cost.tiff", img_cost);

	return 0;
}
