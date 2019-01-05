#include "stdafx.h"
#include "SgmMatcher.h"

#include "CensusTransformer.h"

SgmMatcher::SgmMatcher(const Mat & LeftImg, const Mat & RightImg)
    : m_leftImg{ LeftImg }
    , m_rightImg{ RightImg }
{
}

void SgmMatcher::ComputeCost(const SgmCostType& CostType)
{
    switch (CostType)
    {
    case SgmCostType::CensusTransform:
        ComputeCensusCost();
        break;
    case SgmCostType::MutualInformation:
        throw std::exception("Not implemented");
        break;
    default:
        break;
    }
}

Mat SgmMatcher::ComputeDepthMap()
{
    // compute cost
    ComputeCensusCost();
    return m_cost;

    // aggregate cost

    // calculate new disparities

    // left/right consistency check

    return Mat();
}

void SgmMatcher::ComputeCensusCost()
{
    auto censusCalc = CensusTransformer(20);

    m_cost = censusCalc.CalculateCostMatrix(m_leftImg, m_rightImg);
}
