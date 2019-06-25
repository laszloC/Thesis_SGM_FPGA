#include "stdafx.h"
#include "mi.h"

namespace mutual_information
{

    Mat mutual_information::ComputeJointPdf(const Mat& LeftImg, const Mat& RightImg)
    {
        Mat pdf = Mat::zeros(255, 255, CV_32FC1);

        int height = LeftImg.rows;
        int width = LeftImg.cols;

        for (auto i = 0; i < height; i++)
        {
            for (auto j = 0; j < width; j++)
            {
                auto left = LeftImg.at<uchar>(i, j);
                auto right = RightImg.at<uchar>(i, j);
                pdf.at<float>(left, right)++;
            }
        }

        float n = (float)(height * width);

        for (auto i = 0; i < 255; i++)
        {
            for (auto j = 0; j < 255; j++)
            {
                pdf.at<float>(i, j) /= n;
            }
        }

        return pdf;
    }

}