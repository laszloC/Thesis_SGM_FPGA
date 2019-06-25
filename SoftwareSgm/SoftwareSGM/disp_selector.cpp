#include "stdafx.h"
#include "disp_selector.h"

namespace disparity_selector
{

    Mat WtaDisparity(const Mat& Cost, const int Rows, const int Cols)
    {
        Mat disp = Mat::zeros(Rows, Cols, CV_8UC1);

        for (int i = 0; i < Rows; i++)
        {
            for (int j = 0; j < Cols; j++)
            {
                int minCost = INT_MAX, minD = 0;
                for (int d = 0; d < Cost.cols; d++)
                {
                    auto p = RowMajorIndex(i, j, Cols);
                    if (Cost.at<int>(p, d) < minCost)
                    {
                        minCost = Cost.at<int>(p, d);
                        minD = d;
                    }
                }

                disp.at<uchar>(i, j) = minD;
            }
        }
        std::cout << "Computed disparity" << std::endl;

        return disp;
    }

}
