#pragma once

#include "common.h"

namespace semi_global
{
    // returns the aggregated S cost matrix
    Mat AggregateCosts(Mat& C, const int Rows, const int Cols, const int P1, const int P2);

    // returns the disparity map computed from the cost matrix
    Mat ComputeDisparity(Mat& C, const int Rows, const int Cols);

    // returns the depth-map computed using semi-global matching
    Mat ComputeDepthMap(Mat& C, const int Rows, const int Cols, const int P1, const int P2);

    // checks for left-right consistency between the depth-maps and returns the modified one
    Mat LeftRightCheck(const Mat& DB, const Mat& DM);

} // namespace semi_global
