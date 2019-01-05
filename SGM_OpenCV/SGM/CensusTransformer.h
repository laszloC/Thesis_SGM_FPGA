#pragma once

#include "common.h"

class CensusTransformer
{
public:

    CensusTransformer(const int MaxDisparity);

    Mat CensusTransform(const Mat& Img);

    Mat CalculateCostMatrix(const Mat& Left, const Mat& Right);

private:

    int m_maxDisparity;

    int32_t CensusTransform(const Mat& Img, const int I, const int J);

    Mat ComputeCensusCost(const Mat& CensusLeft, const Mat& CensusRight);

};

void SetBitValue(int32_t& BitMap, const int Bit, const bool Value);

uint8_t HammingDistance(const int32_t A, const int32_t B);
