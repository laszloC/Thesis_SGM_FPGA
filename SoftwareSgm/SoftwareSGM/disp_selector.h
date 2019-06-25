#pragma once

#include "common.h"

namespace disparity_selector
{

    // returns winner-takes-all computed disparity
    Mat WtaDisparity(const Mat& Cost, const int Rows, const int Cols);

} // disparity_selector
