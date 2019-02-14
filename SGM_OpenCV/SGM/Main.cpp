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

std::ostream& operator<<(std::ostream& Out, const CostFnType& FnType)
{
    switch (FnType)
    {
    case CostFnType::Census:
        Out << "Census";
        break;
    case CostFnType::MI:
        Out << "MI";
        break;
    case CostFnType::SAD:
        Out << "SAD";
        break;
    default:
        Out << "UNKNOWN";
        break;
    }

    return Out;
}

CostFnType ChooseCostFunction()
{
    std::cout << "Choose cost function" << std::endl
        << "\t[" <<(int)CostFnType::Census << "]" << " Census cost" << std::endl
        << "\t[" <<(int)CostFnType::MI << "]" << " Mutual Information" << std::endl
        << "\t[" <<(int)CostFnType::SAD << "]" << " Sum of Absolute Differences" << std::endl;
    std::cout << "Cost function: ";

    int method = 0;

    std::cin >> method;

    return CostFnType(method);
}

int GetMaxDisparity()
{
    int maxDsp = 0;
    std::cout << "Max disparity: ";
    std::cin >> maxDsp;

    return maxDsp;
}

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

void SaveResults(const Mat& DepthMapRaw, const Mat& DepthMapSGM, const int MaxDisparity, const int P1, const int P2, const CostFnType CostFn)
{
    char folderName[MAX_PATH];

    if (!openFolderDlg(folderName))
        throw std::logic_error("Could not open folder");

    auto time = std::chrono::system_clock::now();

    std::stringstream saveFolderName;
    saveFolderName << folderName << "\\" << "SGM_Results_" << CostFn << "_" << std::to_string(time.time_since_epoch().count());

    std::experimental::filesystem::create_directory(saveFolderName.str());

    std::stringstream fileNameRaw;
    fileNameRaw << saveFolderName.str() << "\\"
        << "raw" << std::to_string(MaxDisparity)
        << "_" << std::to_string(P1)
        << "_" << std::to_string(P2)
        << ".bmp";

    std::stringstream fileNameSgm;
    fileNameSgm << saveFolderName.str() << "\\"
        << "sgm" << std::to_string(MaxDisparity)
        << "_" << std::to_string(P1)
        << "_" << std::to_string(P2)
        << ".bmp";

    imwrite(fileNameRaw.str(), DepthMapRaw);
    imwrite(fileNameSgm.str(), DepthMapSGM);

    imshow("Raw Depth Map", DepthMapRaw);
    imshow("SGM Depth Map", DepthMapSGM);

    waitKey(10000);
}

int main(int argc, char* argv[])
{
    std::cout << "Press Ctrl+C to exit" << std::endl;

    while (true)
    {
        try
        {
            std::cout << std::endl << "<<----------------------------------------------------------------->>" << std::endl << std::endl;

            std::cout << "Choose left image" << std::endl;
            auto leftImg = OpenGrayscaleImage();
            std::cout << "Choose right image" << std::endl;
            auto rightImg = OpenGrayscaleImage();

            auto costFn = ChooseCostFunction();

            auto maxDisparity = GetMaxDisparity();

            int p1 = 5;
            int p2 = 20;

            std::cout << "P1: ";
            std::cin >> p1;

            std::cout << "P2: ";
            std::cin >> p2;

            Mat costLR;
            Mat costRL;

            ComputeCostMatrixes(leftImg, rightImg, maxDisparity, costFn, costLR, costRL);

            Mat depthMapRaw = ComputeDepthMap(costLR, leftImg.rows, leftImg.cols);
            Scale(depthMapRaw, 0, maxDisparity - 1, 0, 255);

            Mat depthMapLR = semi_global::ComputeDepthMap(costLR, leftImg.rows, leftImg.cols, p1, p2);
            Mat depthMapRL = semi_global::ComputeDepthMap(costRL, leftImg.rows, leftImg.cols, p1, p2);

            semi_global::LeftRightCheck(depthMapLR, depthMapRL);
            Scale(depthMapLR, 0, maxDisparity - 1, 0, 255);

            SaveResults(depthMapRaw, depthMapLR, maxDisparity, p1, p2, costFn);
        }
        catch (const std::exception& e)
        {
            std::cerr << e.what() << std::endl;
        }
    }
}