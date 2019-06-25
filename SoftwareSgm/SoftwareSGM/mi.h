#pragma once

#include "common.h"

namespace mutual_information
{
    Mat ComputePdf(const Mat& Img);

    Mat ComputeJointPdf(const Mat& LeftImg, const Mat& RightImg);

    Mat ComputeDataTerm(const Mat& LeftImg, const Mat& RightImg);
}
