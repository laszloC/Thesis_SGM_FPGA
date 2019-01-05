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

    SgmMatcher(const Mat& m_leftImg, const Mat& m_rightImg);

    void ComputeCost(const SgmCostType& CostType);

    Mat ComputeDepthMap();

private:

    Mat m_leftImg;
    Mat m_rightImg;

    Mat m_cost;

    void ComputeCensusCost();
};

