#include "stdafx.h"
#include "CensusTransformer.h"

#include <bitset>

CensusTransformer::CensusTransformer(const int MaxDisparity)
    : m_maxDisparity{ MaxDisparity }
{
}

Mat CensusTransformer::CensusTransform(const Mat& Img)
{
    // create matrix of uint32_t
    // transform is stored as a 32 bit integer
    Mat imgCensus = Mat(Img.rows, Img.cols, CV_32SC1);

    for (auto i = 0; i < Img.rows; i++)
    {
        for (auto j = 0; j < Img.cols; j++)
        {
            imgCensus.at<int32_t>(i, j) = CensusTransform(Img, i, j);
        }
    }

    return imgCensus;
}

Mat CensusTransformer::CalculateCostMatrix(const Mat& Left, const Mat& Right)
{
    // apply census transform to both images
    Mat leftCensus = CensusTransform(Left);
    Mat rightCensus = CensusTransform(Right);

    // compute the cost matrix using hamming distance
    return ComputeCensusCost(leftCensus, rightCensus);

}

int32_t CensusTransformer::CensusTransform(const Mat& Img, const int I, const int J)
{
    int32_t bitMap = 0;

    for (auto i = -2; i <= 2; i++)
    {
        for (auto j = 0; j <= 2; j++)
        {
            uchar pValue = Img.at<uchar>(I, J);

            auto nI = I + i;
            auto nJ = J + j;

            if (IsInImgRange(nI, nJ, Img.rows, Img.cols) && (nI != I || nJ != J))
                SetBitValue(bitMap, (i + 2) * 2 + (j + 2), pValue > Img.at<uchar>(nI, nJ));
        }
    }

    return bitMap;
}

Mat CensusTransformer::ComputeCensusCost(const Mat& CensusLeft, const Mat& CensusRight)
{
    int rows = CensusLeft.rows * CensusLeft.cols;
    int cols = (m_maxDisparity * 2) + 1;

    Mat costMatrix = Mat::zeros(rows, cols, CV_8UC1);

    // populate cost matrix
    for (auto i = 0; i < CensusLeft.rows; i++)
    {
        for (auto j = 0; j < CensusLeft.cols; j++)
        {
            for (auto d = 0; d < cols; d++)
            {
                auto disp = (d - m_maxDisparity);
                auto j_left = j;
                auto j_right = j + disp;

                if (IsInImgRange(i, j_right, CensusRight.rows, CensusRight.cols)) {
                    auto left = CensusLeft.at<int32_t>(i, j_left);
                    auto right = CensusRight.at<int32_t>(i, j_right);
                    costMatrix.at<uchar>(i * CensusLeft.cols + j, d) = (uchar)HammingDistance(left, right);
                }
            }
        }
    }

    return costMatrix;
}

void SetBitValue(int32_t & BitMap, const int Bit, const bool Value)
{
    BitMap |= (Value << Bit);
}

uint8_t HammingDistance(const int32_t A, const int32_t B)
{
    return (uint8_t)std::bitset<32>(A ^ B).count();
}
