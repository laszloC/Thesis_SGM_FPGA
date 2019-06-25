#include "stdafx.h"
#include "sad.h"

#include "common.h"

namespace cost_sad
{

    Mat cost_sad::SadCost(const Mat& Left, const Mat& Right, const int MaxD, const int BlockWidth, const int DispDir)
    {
        int height = Left.rows * Left.cols;
        int width = MaxD;

        Mat cost = Mat::zeros(height, width, CV_32SC1);

        for (auto i = 0; i < Left.rows; i++)
        {
            for (auto j = 0; j < Left.cols; j++)
            {
                for (auto d = 0; d < MaxD; d++)
                {
                    int cI = i * Left.cols + j, cJ = d;
                    int nI = i, nJ = j + ((DispDir)* d);
                    cost.at<int>(cI, cJ) = SadBlockCost(Left, Right, i, j, nI, nJ, BlockWidth);
                }
            }
        }

        return cost;
    }

    int cost_sad::SadBlockCost(const Mat& Left, const Mat& Right, const int LeftI, const int LeftJ, const int RightI, const int RightJ, const int BW)
    {
        int w = BW / 2;
        int sum = 0;
        for (auto di = -w; di <= w; di++)
        {
            for (auto dj = -w; dj <= w; dj++)
            {
                int lI = LeftI + di, lJ = LeftJ + dj;
                int rI = RightI + di, rJ = RightJ + dj;

                if (IsInImgRange(lI, lJ, Left) && IsInImgRange(rI, rJ, Right))
                {
                    int l = Left.at<uchar>(lI, lJ);
                    int r = Right.at<uchar>(rI, rJ);

                    sum += abs(l - r);
                }
            }
        }

        return sum;
    }

}