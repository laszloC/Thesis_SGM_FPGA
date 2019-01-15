// OpenCVApplication.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "common.h"
#include <ctime>
#include <random>
#include <memory>
#include <queue>
#include <limits>
#include <iostream>

#include "census.h"
#include "semi_global.h"

constexpr auto R_INDEX = 2;
constexpr auto G_INDEX = 1;
constexpr auto B_INDEX = 0;


int main(int argc, char* argv[])
{
    // read images
    /*try
    {*/
        std::cout << "Choose left image" << std::endl;
        auto leftImg = OpenGrayscaleImage();
        std::cout << "Choose right image" << std::endl;
        auto rightImg = OpenGrayscaleImage();

        auto method = 0;
        std::cout << "Choose cost method: " << std::endl
            << " [0] Census cost" << std::endl
            << " [1] Mutual Information" << std::endl;
        std::cout << "Method: ";
        std::cin >> method;

        int maxDisparity = 60;
        std::cout << "Max disparity: ";
        std::cin >> maxDisparity;

        int p1 = 5;
        int p2 = 20;

        std::cout << "P1: ";
        std::cin >> p1;

        std::cout << "P2: ";
        std::cin >> p2;

        Mat costLR;
        Mat costRL;

        // compute cost matrix
        switch (method)
        {
        case 0:
            costLR = census::CalculateCostMatrix(leftImg, rightImg, maxDisparity, -1);
            costRL = census::CalculateCostMatrix(rightImg, leftImg, maxDisparity, +1);
            break;
        case 1:
            std::cerr << "Currently mutual information cost is not supported" << std::endl;
            return -1;
        default:
            std::cerr << "Option not recognized" << std::endl;
            return -1;
        }

        std::cout << "Calculated cost matrix" << std::endl;

        Mat depthMapCensus = census::ComputeDepthMap(costLR, leftImg.rows, leftImg.cols);
        Scale(depthMapCensus, 0, maxDisparity - 1, 0, 255);
        imshow("Census", depthMapCensus);

        Mat depthMapLR = semi_global::ComputeDepthMap(costLR, leftImg.rows, leftImg.cols, p1, p2);
        Mat depthMapRL = semi_global::ComputeDepthMap(costRL, leftImg.rows, leftImg.cols, p1, p2);

        semi_global::LeftRightCheck(depthMapLR, depthMapRL);

        Scale(depthMapLR, 0, maxDisparity - 1, 0, 255);

        imshow("SGM", depthMapLR);

        waitKey();
}