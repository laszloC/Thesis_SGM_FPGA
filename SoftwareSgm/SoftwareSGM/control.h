#pragma once

#include "common.h"

namespace control
{

    // returns the depth map computed from stereo image pair
    Mat ComputeDepthMap(Mat& Left, Mat& Right, int P1, int P2, int MaxDisp, int DispDir, Stats& TimeStats);

    // ensures left-right consistency
    Mat LeftRightCheck(const Mat& DispLR, const Mat DispRL);

} // namespace control
