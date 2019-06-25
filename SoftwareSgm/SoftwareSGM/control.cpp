#include "stdafx.h"
#include "control.h"

#include "sad.h"
#include "semi_global.h"
#include "disp_selector.h"

namespace control
{

    Mat ComputeDepthMap(Mat& Left, Mat& Right, int P1, int P2, int MaxDisp, int DispDir, Stats& TimeStats)
    {
        std::chrono::high_resolution_clock::time_point startTotal, endTotal;
        std::chrono::high_resolution_clock::time_point start, end;

        startTotal = std::chrono::high_resolution_clock::now();

        // compute initial cost using SAD
        start = std::chrono::high_resolution_clock::now();
        Mat costLR = cost_sad::SadCost(Left, Right, MaxDisp, 5, DispDir);
        end = std::chrono::high_resolution_clock::now();
        TimeStats.CostTime = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();

        // aggregate cost matrix
        start = std::chrono::high_resolution_clock::now();
        Mat costLRaggr = cost_aggregator::AggregateCosts(costLR, Left.rows, Left.cols, P1, P2);
        end = std::chrono::high_resolution_clock::now();
        TimeStats.AggrTime = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();

        // compute disparity
        start = std::chrono::high_resolution_clock::now();
        Mat dispLR = disparity_selector::WtaDisparity(costLRaggr, Left.rows, Left.cols);
        end = std::chrono::high_resolution_clock::now();
        TimeStats.DispTime = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();

        endTotal = std::chrono::high_resolution_clock::now();
        TimeStats.TotalTime = std::chrono::duration_cast<std::chrono::microseconds>(endTotal - startTotal).count();

        // median filter
        MedianFilter(dispLR, 3);

        return dispLR;
    }

    Mat LeftRightCheck(const Mat& DispLR, const Mat DispRL)
    {
        Mat disp = DispLR.clone();
        for (auto i = 0; i < DispLR.rows; i++)
        {
            for (auto j = 0; j < DispLR.cols; j++)
            {
                auto iLR = i, jLR = j;
                auto dLR = DispLR.at<uint8_t>(iLR, jLR);

                auto iRL = i, jRL = j - dLR;
                if (IsInImgRange(iRL, jRL, DispRL.rows, DispRL.cols))
                {
                    auto dRL = DispRL.at<uint8_t>(iRL, jRL);

                    if (dLR - dRL > 5)
                    {
                        disp.at<uint8_t>(iLR, jLR) = 0;
                    }
                }
            }
        }

        return disp;
    }

} // namespace control
