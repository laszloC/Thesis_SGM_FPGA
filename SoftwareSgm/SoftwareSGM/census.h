#pragma once

#include "common.h"

namespace census
{

    // computes the census transform of a pixel
    int CensusTransformPixel(const Mat& Img, const int I, const int J);

    // computes the census transform of an image
    Mat CensusTransform(const Mat& Img);

    // computes the pixel's matching cost
    int ComputePixelCost(const Mat& CensusLeft, const Mat& CensusRight, const int I, const int J, const int Disparity, const int DispDir);

    // computes the census based cost of two images
    Mat ComputeCensusCost(const Mat& Left, const Mat& Right, const int MaxDisparity, const int DispDir);

    // builds the cost matrix using the census transform
    Mat CalculateCostMatrix(const Mat& Left, const Mat& Right, const int MaxDisparity, const int DispDir);

} // namespace census
