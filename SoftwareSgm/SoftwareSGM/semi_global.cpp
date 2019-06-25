#include "stdafx.h"
#include "semi_global.h"

#include <limits>
#include <set>

#include "census.h"

namespace cost_aggregator
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

    void InitializeCosts(Mat& S, const Mat& C, const std::set<std::pair<int, int>>& StartingPixels,
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

    Mat AggregateCosts(Mat& Original, const int Rows, const int Cols, const int P1, const int P2)
    {
        Mat aggregated = Mat::zeros(Original.rows, Original.cols, CV_32SC1);

        std::cout << "Aggregating top-down" << std::endl;

        AggregateTopDown(Original, aggregated, Rows, Cols, P1, P2);

        std::cout << "Aggregating bottom-up" << std::endl;

        AggregateBottomUp(Original, aggregated, Rows, Cols, P1, P2);

        //const int RI[8] = { -1, -1, -1,  0, +1, +1, +1,  0 };
        //const int RJ[8] = { -1,  0, +1, +1, +1,  0, -1, -1 };

        //for (auto r = 0; r < 8; r++)
        //{
        //    S += ComputePathCosts(C, RI[r], RJ[r], Rows, Cols, P1, P2);
        //    std::cout << "Aggregated cost in direction " << r << std::endl;
        //}

        return aggregated;
    }

    void AggregateTopDown(Mat& Original, Mat& Aggregated, const int Rows, const int Cols, const int P1, const int P2)
    {
        Mat tempL = Mat::zeros(2 * Cols, 4 * Original.cols, CV_32SC1);
        Mat tempMinL = Mat::zeros(2 * Cols, 4, CV_32SC1);
        tempMinL = INT_MAX;

        for (int i = 0; i < Rows; i++)
        {
            for (int j = 0; j < Cols; j++)
            {
                for (int r = 0; r < 4; r++)
                {
                    AggregateOnPath(Original, Aggregated, tempL, tempMinL, i, j, Rows, Cols, r, P1, P2, Original.cols);
                }
            }

            // shift the rows
            for (int j = 0; j < Cols; j++)
            {
                for (int r = 0; r < 4; r++)
                {
                    tempMinL.at<int>(j, r) = tempMinL.at<int>(Cols + j, r);
                    tempMinL.at<int>(Cols + j, r) = INT_MAX;
                }

                for (int r = 0; r < 4 * Original.cols; r++) {
                    tempL.at<int>(j, r) = tempL.at<int>(Cols + j, r);
                    tempL.at<int>(Cols + j, r) = 0;
                }
            }
        }
    }

    void AggregateBottomUp(Mat& Original, Mat& Aggregated, const int Rows, const int Cols, const int P1, const int P2)
    {
        Mat tempL = Mat::zeros(2 * Cols, 4 * Original.cols, CV_32SC1);
        Mat tempMinL = Mat::zeros(2 * Cols, 4, CV_32SC1);
        tempMinL = INT_MAX;

        for (int i = Rows - 1; i >= 0; i--)
        {
            for (int j = Cols - 1; j >= 0; j--)
            {
                for (int r = 4; r < 8; r++)
                {
                    AggregateOnPath(Original, Aggregated, tempL, tempMinL, i, j, Rows, Cols, r, P1, P2, Original.cols);
                }
            }

            // shift the rows
            for (int j = 0; j < Cols; j++)
            {
                for (int r = 0; r < 4; r++)
                {
                    tempMinL.at<int>(j, r) = tempMinL.at<int>(Cols + j, r);
                    tempMinL.at<int>(Cols + j, r) = INT_MAX;
                }

                for (int r = 0; r < 4 * Original.cols; r++) {
                    tempL.at<int>(j, r) = tempL.at<int>(Cols + j, r);
                    tempL.at<int>(Cols + j, r) = 0;
                }
            }
        }
    }

    void AggregateOnPath(Mat& Cost, Mat& Aggregated, Mat& TempL, Mat& TempMinL, const int I, const int J,
        const int Rows, const int Cols, const int R, const int P1, const int P2, const int MaxDisp)
    {
        int di[8] = { -1, -1, -1,  0, +1, +1, +1,  0 };
        int dj[8] = { -1,  0, +1, -1, +1,  0, -1, +1 };

        int p = RowMajorIndex(I, J, Cols);

        int iPrev = I + di[R], jPrev = J + dj[R];

        int iTempCurr = Cols + I; // i index in temporary cost matrix of current pixel
        int iTempPrev = (((R == 4) || (R == 8)) ? 0 : Cols) + iPrev; // i index in temporary cost matrix of previous pixel
        int jTemp; // j index in temporary cost matrix

        for (int d = 0; d < MaxDisp; d++)
        {
            jTemp = (R % 4) * MaxDisp + d;

            if (iPrev < 0 || jPrev < 0 || iPrev >= Rows || iPrev >= Cols)
            {
                TempL.at<int>(iTempCurr, jTemp) = (int)Cost.at<int>(p, d);
            }
            else
            {
                TempL.at<int>(iTempCurr, jTemp) = Cost.at<int>(p, d) +
                    MinCost(TempL, iTempPrev, R, d, P1, P2, MaxDisp) - TempMinL.at<int>(iTempPrev, R % 4);
            }

            Aggregated.at<int>(p, d) += TempL.at<int>(iTempCurr, jTemp);

            if (TempL.at<int>(iTempCurr, jTemp) < TempMinL.at<int>(iTempCurr, R % 4))
            {
                TempMinL.at<int>(iTempCurr, R % 4) = TempL.at<int>(iTempCurr, jTemp);
            }
        }
    }

    int MinCost(Mat& TempL, const int I, const int R, const int D, const int P1, const int P2, const int MaxDisp)
    {
        int min = INT_MAX;
        int j;
        int delta_d;

        for (int cd = 0; cd < MaxDisp; cd++)
        {
            delta_d = abs(D - cd);
            j = R * MaxDisp + cd;
            int l = TempL.at<int>(I, j);

            if (delta_d == 1) 
            { 
                l += P1; 
            }
            else if (delta_d > 1) 
            { 
                l += P2; 
            }

            if (l < min)
            {
                min = l;
            }
        }

        return min;
    }

} // namespace semi_global
