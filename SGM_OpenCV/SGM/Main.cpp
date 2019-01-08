// OpenCVApplication.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "common.h"
#include <ctime>
#include <random>
#include <memory>
#include <queue>
#include <limits>

#include "SgmMatcher.h"

constexpr auto R_INDEX = 2;
constexpr auto G_INDEX = 1;
constexpr auto B_INDEX = 0;


int main()
{
    // read images
    try
    {
        auto leftImg = OpenGrayscaleImage();
        auto rightImg = OpenGrayscaleImage();

        int max_disparity = 30;

        SgmMatcher matcher(leftImg, rightImg, max_disparity);
        Mat depthMap = matcher.ComputeDepthMap();

        Scale(depthMap, 0, max_disparity, 0, 256);

        imshow("Depth map", depthMap);

        waitKey();

        //imwrite("D:/depthMap.jpg", depthMap);
    }
    catch (const std::exception& e)
    {
        std::cout << e.what() << std::endl;
        return -1;
    }
}