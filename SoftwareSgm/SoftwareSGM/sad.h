#pragma once

#include "common.h"

namespace cost_sad
{
    Mat SadCost(const Mat& Left, const Mat& Right, const int MaxD, const int BW, const int DispDir);

    int SadBlockCost(const Mat& Left, const Mat& Right, const int LeftI, const int LeftJ, const int RightI, const int RightJ, const int BW);
}
