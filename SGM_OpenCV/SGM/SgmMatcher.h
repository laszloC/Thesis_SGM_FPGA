#pragma once

#include "common.h"

enum class SgmCostType
{
    CensusTransform,
    MutualInformation
};

class SgmMatcher
{
public:

    SgmMatcher(const Mat& m_leftImg, const Mat& m_rightImg, const int MaxDisparity);

    void ComputeCost(const SgmCostType& CostType);

    Mat ComputeDepthMap();

private:

    Mat m_leftImg;
    Mat m_rightImg;

    Mat m_cost;

    int m_maxDisparity;

    const float P1 = 1;
    const float P2 = 2;

    const int RI[8] = { -1, -1, -1,  0, +1, +1, +1,  0 };
    const int RJ[8] = { -1,  0, +1, +1, +1,  0, -1, -1 };

    void ComputeCensusCost();

    void AggregateCosts();

    Mat ComputeCostInDirection(const int R);

    void ComputeCostInDirection(const int DI, const int DJ, const int SI, const int SJ, Mat& Cost, const int D);

    Mat ComputeDisparity(bool Mirrored);
};

