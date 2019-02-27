#include "stdafx.h"
#include "census.h"
#include "common.h"

#include <bitset>

namespace census
{
    static int censusNeighbours[32][2] = {
    {-4, -4},
    {-4, -2},
    {-4, 0},
    {-4, +2},
    {-4, +4},

    {-3, -3},
    {-3, +3},

    {-2, -4},
    {-2, -2},
    {-2, 0},
    {-2, +2},
    {-2, +4},

    {-1, -1},
    {-1, +1},

    {0, -4},
    {0, -2},
    {0, +2},
    {0, +4},

    {+1, -1},
    {+1, +1},

    {+2, -4},
    {+2, -2},
    {+2, 0},
    {+2, +2},
    {+2, +4},

    {+3, -3},
    {+3, +3},

    {+4, -4},
    {+4, -2},
    {+4, 0},
    {+4, +2},
    {+4, +4}
    };

    int CensusTransformPixel(const Mat& Img, const int I, const int J)
    {
        int bitMap = 0;
        int k = 0;

        for (auto i = -2; i <= 2; i++)
        {
            for (auto j = -2; j <= 2; j++)
            {
                uchar pValue = Img.at<uchar>(I, J);

                auto nI = I + i;
                auto nJ = J + j;

                if (IsInImgRange(nI, nJ, Img) && (nI != I || nJ != J))
                {
                    SetBitValue(bitMap, k, pValue > Img.at<uchar>(nI, nJ));
                }
                k++;
            }
        }

        return bitMap;
    }

    Mat CensusTransform(const Mat& Img)
    {
        Mat imgCensus = Mat(Img.rows, Img.cols, CV_32SC1);

        for (auto i = 0; i < Img.rows; i++)
        {
            for (auto j = 0; j < Img.cols; j++)
            {
                imgCensus.at<int>(i, j) = CensusTransformPixel(Img, i, j);
            }
        }

        return imgCensus;
    }

    int ComputePixelCost(const Mat& CensusLeft, const Mat& CensusRight, const int I, const int J, const int Disparity, const int DispDir)
    {
        auto initial = true;
        int cost = 1000;
        for (auto di = 0; di <= 0; di++)
        {
            for (auto dj = 0; dj <= 0; dj++)
            {
                auto iRight = I + di;
                auto jRight = J + dj + (DispDir * Disparity);
                if (IsInImgRange(iRight, jRight, CensusLeft))
                {
                    auto left = CensusLeft.at<int>(I, J);
                    auto right = CensusRight.at<int>(iRight, jRight);
                    auto p = RowMajorIndex(I, J, CensusLeft.cols);
                    if (initial)
                    {
                        cost = 0; initial = false;
                    }
                    cost += HammingDistance(left, right);
                }
            }
        }

        return cost;
    }

    Mat ComputeCensusCost(const Mat& CensusLeft, const Mat& CensusRight, const int MaxDisparity, const int DispDir)
    {
        int rows = CensusLeft.rows * CensusLeft.cols;
        int cols = MaxDisparity;

        Mat costMatrix = Mat(rows, cols, CV_32SC1);

        // populate cost matrix
        for (auto i = 0; i < CensusLeft.rows; i++)
        {
            for (auto j = 0; j < CensusLeft.cols; j++)
            {
                for (auto d = 0; d < cols; d++)
                {
                    auto p = RowMajorIndex(i, j, CensusLeft.cols);
                    costMatrix.at<int>(p, d) = ComputePixelCost(CensusLeft, CensusRight, i, j, d, DispDir);
                }
            }
        }

        return costMatrix;
    }

    Mat CalculateCostMatrix(const Mat& Left, const Mat& Right, const int MaxDisparity, const int DispDir)
    {
        // apply census transform to both images
        Mat leftCensus = CensusTransform(Left);
        Mat rightCensus = CensusTransform(Right);

        // compute the cost matrix using hamming distance
        return ComputeCensusCost(leftCensus, rightCensus, MaxDisparity, DispDir);
    }

}