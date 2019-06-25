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
#include "control.h"

void WriteTimeStats(const std::string& FileName, const Stats& TimeStats)
{
    std::stringstream ssTime;

    ssTime << "{" << std::endl
        << "\t\"cost_time\": " << TimeStats.CostTime << "," << std::endl
        << "\t\"aggr_time\": " << TimeStats.AggrTime << "," << std::endl
        << "\t\"disp_time\": " << TimeStats.DispTime << "," << std::endl
        << "\t\"total_time\": " << TimeStats.TotalTime << "," << std::endl
        << "}" << std::endl;

    if (std::ofstream outFile{ FileName })
    {
        outFile << ssTime.str();
    }
    else
    {
        throw std::exception("Failed to write time results");
    }
}

// program.exe <left_path> <right_path> <result_path> <cost_fn> <p1> <p2> <max_disp>
int main(int argc, char* argv[])
{
    int iLeftImg = 1;
    int iRightImg = 2;
    int iDepthMapPath = 3;
    int iTimeResPath = 4;
    int iCostFn = 5;
    int iP1 = 6;
    int iP2 = 7;
    int iMaxDisp = 8;

    if (argc != 9) {
        std::cout << "Usage: " << std::endl
            << argv[0] << " <left_img_path> <right_img_path> <depth_map_path> <time_res_path> <cost_fn> <p1> <p2> <max_disp>" << std::endl;
        return -1;
    }

    try
    {
        auto leftImg = OpenGrayscaleImage(argv[iLeftImg]);
        auto rightImg = OpenGrayscaleImage(argv[iRightImg]);
        auto depthMapPath = std::string(argv[iDepthMapPath]);
        auto timeResPath = std::string(argv[iTimeResPath]);
        auto p1 = std::atoi(argv[iP1]);
        auto p2 = std::atoi(argv[iP2]);
        auto maxDisp = std::atoi(argv[iMaxDisp]);

        std::cout << "Running SGM with parameters: " << std::endl
            << "\tLeft image: " << argv[iLeftImg] << std::endl
            << "\tRight image: " << argv[iRightImg] << std::endl
            << "\tDepth map path: " << argv[iDepthMapPath] << std::endl
            << "\tTime results path: " << argv[iTimeResPath] << std::endl
            << "\tCost function: " << argv[iCostFn] << std::endl
            << "\tP1: " << argv[iP1] << std::endl
            << "\tP2: " << argv[iP2] << std::endl
            << "\tMax Disparity: " << argv[iMaxDisp] << std::endl;

        Stats timeStats;

        Mat depthMap = control::ComputeDepthMap(leftImg, rightImg, p1, p2, maxDisp, -1, timeStats);

        Scale(depthMap, 0, 31, 0, 255);

        imwrite(depthMapPath, depthMap);
        std::cout << "Saved depth map to " << depthMapPath << std::endl;

        WriteTimeStats(timeResPath, timeStats);
        std::cout << "Saved time results to " << timeResPath << std::endl;

        //imshow("RAW", depthMapRaw);
        //imshow("SGM", depthMap);
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }
}