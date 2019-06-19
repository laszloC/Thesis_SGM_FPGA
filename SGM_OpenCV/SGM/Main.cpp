// OpenCVApplication.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "common.h"
#include <ctime>
#include <chrono>
#include <filesystem>
#include <random>
#include <memory>
#include <queue>
#include <limits>
#include <iostream>

#include "census.h"
#include "sad.h"
#include "semi_global.h"

enum class CostFnType
{
    Census = 0,
    MI,
    SAD
};

void ComputeCostMatrixes(const Mat& LeftImg, const Mat& RightImg, const int MaxDsp, const CostFnType& CostFn, Mat& CostLR, Mat& CostRL)
{
    switch (CostFn)
    {
    case CostFnType::Census:
        CostLR = census::CalculateCostMatrix(LeftImg, RightImg, MaxDsp, -1);
        CostRL = census::CalculateCostMatrix(RightImg, LeftImg, MaxDsp, +1);
        break;
    case CostFnType::MI:
        throw std::invalid_argument("Mutual information cost is not yet implemented.");
        break;
    case CostFnType::SAD:
        CostLR = sad::SadCost(LeftImg, RightImg, MaxDsp, 5, -1);
        CostRL = sad::SadCost(RightImg, LeftImg, MaxDsp, 5, +1);
        break;
    default:
        throw std::invalid_argument("Option not recognized");
    }
}

CostFnType GetCostFn(const std::string& CostFn)
{
    std::string costStr = CostFn;
    std::transform(costStr.begin(), costStr.end(), costStr.begin(), ::tolower);

    if (costStr == "census") return CostFnType::Census;

    if (costStr == "mi") return CostFnType::MI;

    if (costStr == "sad") return CostFnType::SAD;

    return CostFnType::SAD;
}

// program.exe <left_path> <right_path> <result_path> <cost_fn> <p1> <p2> <max_disp>
int main(int argc, char* argv[])
{
    int iLeftImg = 1;
    int iRightImg = 2;
    int iResultPath = 3;
    int iCostFn = 4;
    int iP1 = 5;
    int iP2 = 6;
    int iMaxDisp = 7;

    if (argc != 8) {
        std::cout << "Usage: " << std::endl
            << argv[0] << " <left_img_path> <right_img_path> <result_path> <cost_fn> <p1> <p2> <max_disp>" << std::endl;
        return -1;
    }

    try
    {
        auto leftImg = OpenGrayscaleImage(argv[iLeftImg]);
        auto rightImg = OpenGrayscaleImage(argv[iRightImg]);
        auto resultPath = std::string(argv[iResultPath]);
        auto costFn = GetCostFn(argv[iCostFn]);
        auto p1 = std::atoi(argv[iP1]);
        auto p2 = std::atoi(argv[iP2]);
        auto maxDisp = std::atoi(argv[iMaxDisp]);

        std::cout << "Running SGM with parameters: " << std::endl
            << "\tLeft image: " << argv[iLeftImg] << std::endl
            << "\tRight image: " << argv[iRightImg] << std::endl
            << "\tResult path: " << argv[iResultPath] << std::endl
            << "\tCost function: " << argv[iCostFn] << std::endl
            << "\tP1: " << argv[iP1] << std::endl
            << "\tP2: " << argv[iP2] << std::endl
            << "\tMax Disparity: " << argv[iMaxDisp] << std::endl;

        Mat costLR;
        Mat costRL;

        ComputeCostMatrixes(leftImg, rightImg, maxDisp, costFn, costLR, costRL);

        Mat depthMapRaw = ComputeDepthMap(costLR, leftImg.rows, leftImg.cols);
        Scale(depthMapRaw, 0, maxDisp - 1, 0, 255);

        Mat depthMapLR = semi_global::ComputeDepthMap(costLR, leftImg.rows, leftImg.cols, p1, p2);
        Mat depthMapRL = semi_global::ComputeDepthMap(costRL, leftImg.rows, leftImg.cols, p1, p2);

        Mat depthMap = semi_global::LeftRightCheck(depthMapLR, depthMapRL);
        Scale(depthMap, 0, maxDisp - 1, 0, 255);

        imwrite(resultPath, depthMap);

        //imshow("RAW", depthMapRaw);
        //imshow("SGM", depthMap);
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }
}