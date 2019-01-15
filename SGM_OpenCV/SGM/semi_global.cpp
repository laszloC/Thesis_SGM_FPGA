#include "stdafx.h"
#include "semi_global.h"

#include <limits>
#include <set>

#include "census.h"

namespace semi_global
{
    std::set<std::pair<int, int>> GetStartingPixels(const int Rows, const int Cols, const int RI, const int RJ)
    {
        std::set<std::pair<int, int>> startingPixels;

        if (RI == -1)
        {
            for (auto j = 0; j < Cols; j++)
            {
                startingPixels.insert(std::pair<int, int>(Rows - 1, j));
            }
        }
        else if (RI == 1)
        {
            for (auto j = 0; j < Cols; j++)
            {
                startingPixels.insert(std::pair<int, int>(0, j));
            }
        }

        if (RJ == -1)
        {
            for (auto i = 0; i < Rows; i++)
            {
                startingPixels.insert(std::pair<int, int>(i, Cols - 1));
            }
        }
        else if (RJ == 1)
        {
            for (auto i = 0; i < Rows; i++)
            {
                startingPixels.insert(std::pair<int, int>(i, 0));
            }
        }

        return startingPixels;
    }

    void InitializeCosts(Mat& S, const Mat& C, const std::set<std::pair<int, int>> StartingPixels,
        const int Rows, const int Cols)
    {
        for (auto& p : StartingPixels)
        {
            auto pIndex = RowMajorIndex(p.first, p.second, Cols);
            for (auto d = 0; d < C.cols; d++)
            {
                S.at<int>(pIndex, d) = C.at<int>(pIndex, d);
            }
        }
    }

    void ComputePathCost(Mat& S, const Mat& C, const std::pair<int, int>& StartP, const int RI, const int RJ,
        const int Rows, const int Cols, const int Disparity, const int P1, const int P2)
    {
        for (int currI = StartP.first + RI, currJ = StartP.second + RJ, prevI = StartP.first, prevJ = StartP.second;
            IsInImgRange(currI, currJ, Rows, Cols);
            prevI = currI, prevJ = currJ, currI += RI, currJ += RJ)
        {
            auto currP = RowMajorIndex(currI, currJ, Cols);
            auto prevP = RowMajorIndex(prevI, prevJ, Cols);
            auto minPrevC = INT_MAX;
            auto minPrevCPenalised = INT_MAX;

            auto currentC = C.at<int>(currP, Disparity);

            for (auto d = 0; d < S.cols; d++)
            {
                auto penalty = (abs(Disparity - d) == 0) ? 0 : ((abs(Disparity - d) > 1) ? P2 : P1);
                auto prevS = S.at<int>(prevP, d);
                if ((int)prevS < minPrevC)
                {
                    minPrevC = prevS;
                }
                if ((prevS + penalty) < minPrevCPenalised)
                {
                    minPrevCPenalised = prevS + penalty;
                }
            }

            S.at<int>(currP, Disparity) = currentC + minPrevCPenalised - minPrevC;
        }
    }

    Mat ComputePathCosts(Mat& C, const int RI, const int RJ, const int Rows, const int Cols, const int P1, const int P2)
    {
        Mat S = Mat::zeros(C.rows, C.cols, CV_32SC1);

        auto startingPixels = GetStartingPixels(Rows, Cols, RI, RJ);

        InitializeCosts(S, C, startingPixels, Rows, Cols);

        for (auto d = 0; d < C.cols; d++)
        {
            for (auto& p : startingPixels)
            {
                ComputePathCost(S, C, p, RI, RJ, Rows, Cols, d, P1, P2);
            }
        }

        return S;
    }

    Mat AggregateCosts(Mat& C, const int Rows, const int Cols, const int P1, const int P2)
    {
        Mat S = Mat::zeros(C.rows, C.cols, CV_32SC1);

        const int RI[8] = { -1, -1, -1,  0, +1, +1, +1,  0 };
        const int RJ[8] = { -1,  0, +1, +1, +1,  0, -1, -1 };

        for (auto r = 0; r < 8; r++)
        {
            S += ComputePathCosts(C, RI[r], RJ[r], Rows, Cols, P1, P2);
            std::cout << "Aggregated cost in direction " << r << std::endl;
        }

        return S;
    }

    Mat ComputeDisparity(Mat& C, const int Rows, const int Cols)
    {
        Mat disp = Mat::zeros(Rows, Cols, CV_8UC1);

        for (int i = 0; i < Rows; i++)
        {
            for (int j = 0; j < Cols; j++)
            {
                auto minCost = INT_MAX; auto minD = -1;
                for (auto d = 0; d < C.cols; d++)
                {
                    auto p = RowMajorIndex(i, j, Cols);
                    if (C.at<int>(p, d) < minCost)
                    {
                        minCost = C.at<int>(p, d);
                        minD = d;
                    }
                }

                disp.at<uchar>(i, j) = minD;
            }
        }
        std::cout << "Computed disparity" << std::endl;

        return disp;
    }

    Mat ComputeDepthMap(Mat& C, const int Rows, const int Cols, const int P1, const int P2)
    {
        Mat s = AggregateCosts(C, Rows, Cols, P1, P2);

        std::cout << "Aggregated costs" << std::endl;

        Mat depthMap = ComputeDisparity(s, Rows, Cols);

        MedianFilter(depthMap, 3);

        return depthMap;
    }

    Mat LeftRightCheck(const Mat& DB, const Mat& DM)
    {
        Mat disp = Mat::zeros(DB.rows, DB.cols, CV_8UC1);
        for (auto i = 0; i < DB.rows; i++)
        {
            for (auto j = 0; j < DB.cols; j++)
            {
                auto iB = i, jB = j;
                auto dB = DB.at<uint8_t>(iB, jB);

                auto iM = i, jM = j - dB;
                if (IsInImgRange(iM, jM, DM.rows, DM.cols))
                {
                    auto dM = DM.at<uint8_t>(iM, jM);

                    if (iM - dM > 1)
                    {
                        disp.at<uint8_t>(iB, jB) = 0;
                    }
                }
            }
        }

        return disp;
    }

} // namespace semi_global