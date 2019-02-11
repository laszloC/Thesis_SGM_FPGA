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
#include "sad.h"
#include "semi_global.h"

constexpr auto R_INDEX = 2;
constexpr auto G_INDEX = 1;
constexpr auto B_INDEX = 0;


int main(int argc, char* argv[])
{
    std::cout << "Press Ctrl+C to exit" << std::endl;
    while (true)
    {
        std::cout << "Choose left image" << std::endl;
        auto leftImg = OpenGrayscaleImage();
        std::cout << "Choose right image" << std::endl;
        auto rightImg = OpenGrayscaleImage();

        auto method = 0;
        std::cout << "Choose cost method: " << std::endl
            << " [0] Census cost" << std::endl
            << " [1] Mutual Information" << std::endl
            << " [2] Sum of Absolute Differences" << std::endl;
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
        case 2:
            costLR = sad::SadCost(leftImg, rightImg, maxDisparity, 5, -1);
            costRL = sad::SadCost(rightImg, leftImg, maxDisparity, 5, +1);
            break;
        default:
            std::cerr << "Option not recognized" << std::endl;
            return -1;
        }

        std::cout << "Calculated cost matrix" << std::endl;

        Mat depthMapCensus = census::ComputeDepthMap(costLR, leftImg.rows, leftImg.cols);
        Scale(depthMapCensus, 0, maxDisparity - 1, 0, 255);
        imshow("Census", depthMapCensus);

        char saveFolder[MAX_PATH];

        std::cout << "Choose folder to save results " << std::endl;

        openFolderDlg(saveFolder);

        imwrite(std::string(saveFolder) + "/census" + std::to_string(maxDisparity) + "_" + std::to_string(p1) + "_" + std::to_string(p2) + ".bmp", depthMapCensus);

        Mat depthMapLR = semi_global::ComputeDepthMap(costLR, leftImg.rows, leftImg.cols, p1, p2);
        Mat depthMapRL = semi_global::ComputeDepthMap(costRL, leftImg.rows, leftImg.cols, p1, p2);

        semi_global::LeftRightCheck(depthMapLR, depthMapRL);

        Scale(depthMapLR, 0, maxDisparity - 1, 0, 255);

        imshow("SGM", depthMapLR);

        imwrite(std::string(saveFolder) + "/sgm" + std::to_string(maxDisparity) + "_" + std::to_string(p1) + "_" + std::to_string(p2) + ".bmp", depthMapLR);

        waitKey();
    }
}