#include "stdafx.h"
#include "SgmMatcher.h"

#include <limits>

#include "CensusTransformer.h"

SgmMatcher::SgmMatcher(const Mat & LeftImg, const Mat & RightImg, const int MaxDisparity)
    : m_leftImg{ LeftImg }
    , m_rightImg{ RightImg }
    , m_maxDisparity{ MaxDisparity }
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

    // aggregate cost
    AggregateCosts();

    // calculate new disparities
    Mat dspBM = ComputeDisparity(false);
    MedianFilter(dspBM, 5);

    Mat dspMB = ComputeDisparity(true);
    MedianFilter(dspMB, 5);

    // left/right consistency check
    InvalidateOutliers(dspBM, dspMB);

    return dspBM;
}

void SgmMatcher::ComputeCensusCost()
{
    auto censusCalc = CensusTransformer(m_maxDisparity);

    m_cost = censusCalc.CalculateCostMatrix(m_leftImg, m_rightImg);
}

void SgmMatcher::AggregateCosts()
{
    auto rows = m_leftImg.rows;
    auto cols = m_leftImg.cols;

    Mat sCost = Mat(m_cost.rows, m_cost.cols, CV_32SC1);

    for (auto r = 0; r < 8; r++)
    {
        // compute the aggregated cost in direction r
        auto cCost = ComputeCostInDirection(r);

        // add aggregated cost to sCost
        sCost += cCost;
    }

    m_cost = sCost;
}

Mat SgmMatcher::ComputeCostInDirection(const int R)
{
    auto i_inc = RI[R];
    auto j_inc = RJ[R];

    auto rows = m_leftImg.rows;
    auto cols = m_leftImg.cols;

    Mat cost = Mat::zeros(m_cost.rows, m_cost.cols, CV_32SC1);
    std::set<std::pair<int, int>> startingPixels;

    if (i_inc == -1)
    {
        for (auto j = 0; j < cols; j++)
        {
            auto p = (rows - 1) * cols + j;
            for (auto d = 0; d < m_cost.cols; d++)
            {
                cost.at<int32_t>(p, d) = (int32_t)m_cost.at<uint8_t>(p, d);
            }
            startingPixels.emplace(std::pair<int, int>(rows - 1, j));
        }
    }

    if (i_inc == 1)
    {
        for (auto j = 0; j < cols; j++)
        {
            auto p = 0 * cols + j;
            for (auto d = 0; d < m_cost.cols; d++)
            {
                cost.at<int32_t>(p, d) = (int32_t)m_cost.at<uint8_t>(p, d);
            }
            startingPixels.emplace(std::pair<int, int>(0, j));
        }
    }

    if (j_inc == -1)
    {
        for (auto i = 0; i < rows; i++)
        {
            auto p = i * cols + (cols - 1);
            for (auto d = 0; d < m_cost.cols; d++)
            {
                cost.at<int32_t>(p, d) = (int32_t)m_cost.at<uint8_t>(p, d);
            }
            startingPixels.emplace(std::pair<int, int>(i, cols - 1));
        }
    }

    if (j_inc == 1)
    {
        for (auto i = 0; i < rows; i++)
        {
            auto p = i * cols + 0;
            for (auto d = 0; d < m_cost.cols; d++)
            {
                cost.at<int32_t>(p, d) = (int32_t)m_cost.at<uint8_t>(p, d);
            }
            startingPixels.emplace(std::pair<int, int>(i, 0));
        }
    }

    for (auto d = 0; d < m_cost.cols; d++)
    {
        std::set<std::pair<int, int>>::iterator it;
        for (it = startingPixels.begin(); it != startingPixels.end(); ++it)
        {
            ComputeCostInDirection(i_inc, j_inc, it->first, it->second, cost, d);
        }
    }
    return cost;
}

void SgmMatcher::ComputeCostInDirection(const int DI, const int DJ, const int SI, const int SJ, Mat& Cost, const int D)
{
    auto rows = m_leftImg.rows;
    auto cols = m_leftImg.cols;

    for (auto currI = SI + DI, currJ = SJ + DJ, prevI = SI, prevJ = SJ;
        IsInImgRange(currI, currJ, rows, cols);
        prevI = currI, prevJ = currJ, currI += DI, currJ += DJ)
    {
        auto currP = currI * cols + currJ;
        auto prevP = prevI * cols + prevJ;
        auto minPrevC = INT32_MAX;
        auto minPrevPenilezed = INT32_MAX;

        auto currC = m_cost.at<int8_t>(currP, D);

        for (auto d = 0; d < Cost.cols; d++)
        {
            auto disp = d - m_maxDisparity;
            auto penalty = (abs(disp - D) == 0) ? 0 : ((abs(disp - D) > 1) ? P2 : P1);
            auto prevC = Cost.at<int32_t>(prevP, d);
            if (prevC < minPrevC)
            {
                minPrevC = prevC;
            }

            if (prevC + penalty < minPrevPenilezed)
            {
                minPrevPenilezed = prevC + penalty;
            }
        }

        Cost.at<int32_t>(currP, D) = currC + minPrevPenilezed - minPrevC;
    }
}

Mat SgmMatcher::ComputeDisparity(bool Mirrored)
{
    Mat&left = (!Mirrored) ? m_leftImg : m_rightImg;
    Mat&right = (!Mirrored) ? m_rightImg: m_leftImg;

    Mat Disparity = Mat::zeros(left.rows, left.cols, CV_8UC1);

    for (auto i = 0; i < left.rows; i++)
    {
        for (auto j = 0; j < left.cols; j++)
        {
            auto minCost = INT32_MAX;
            auto minD = 0;

            auto p = i * left.cols + j;

            for (auto d = 0; d < m_cost.cols; d++)
            {
                if (m_cost.at<int32_t>(p, d) < minCost)
                {
                    minCost = m_cost.at<int32_t>(p, d);
                    minD = d;
                }
            }

            Disparity.at<uchar>(i, j) = minD;
        }
    }

    return Disparity;
}

void SgmMatcher::InvalidateOutliers(Mat& DspBM, Mat& DspMB)
{
    for (auto i = 0; i < DspBM.rows; i++)
    {
        for (auto j = 0; j < DspBM.cols; j++)
        {
            auto disp = DspBM.at<uchar>(i, j);
            if (abs(DspBM.at<uchar>(i, j) - DspMB.at<uchar>(i + disp , j)) > 1)
            {
                DspBM.at<uchar>(i, j) = 0;
            }
        }
    }
}
