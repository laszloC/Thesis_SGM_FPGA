#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

#include "aggr.h"

using namespace cv;

int main(int arc, char** argv)
{
	Mat cost_in(IMG_SIZE, MAX_DISP, CV_32SC1);

	FileStorage in_file("E:/test/rsz_cost.ext", FileStorage::READ);
	in_file["cost"] >> cost_in;
	in_file.release();

	Mat cost_out(IMG_SIZE, MAX_DISP, CV_32SC1);

	aggr((int32_t*)cost_in.data, 15, 40, (int32_t*)cost_out.data);

	std::cout << "Aggregated cost" << std::endl;

	FileStorage out_file("E:/test/aggregated.ext", FileStorage::WRITE);
	out_file << "cost" << cost_out;
	out_file.release();

	return 0;
}
