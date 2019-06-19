// OpenCVApplication.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "common.h"

#include "Commands.h"
#include "ImageTransmitter.h"
#include "Exceptions.h"

//const std::string m_pc_host = "192.168.1.20";
//const std::string m_pc_port = "50001";

void BuildTestImages() {
    char dirPath[MAX_PATH];
    if (openFolderDlg(dirPath)) {
        for (int t = 10; t <= 10000; t *= 10)
        {
            std::string fileName = std::string(dirPath) + "/tst" + std::to_string(t) + ".bmp";
            Mat m = Mat(t, t, CV_8UC1);
            for (auto i = 0; i < t; i++)
            {
                for (auto j = 0; j < t; j++)
                {
                    m.at<uchar>(i, j) = (i * t + j) / 100;
                }
            }
            imwrite(fileName, m);
        }
        std::cout << "Wrote test images to disk";
    }
}

int main(int argc, char** argv)
{
    int iLeftImg = 1;
    int iRightImg = 2;
    int iResultPath = 3;
    int iCostFn = 4;
    int iP1 = 5;
    int iP2 = 6;
    int iMaxDisp = 7;

    if (argc != 8)
    {
        std::cerr << "Usage:" << std::endl
            << argv[0] << " <left_img_path> <right_img_path> <result_path> <cost_fn> <p1> <p2> <max_disp>" << std::endl;
        return -1;
    }

    try
    {
        // open images
        auto leftImg = OpenGrayscaleImage(argv[iLeftImg]);
        auto rightImg = OpenGrayscaleImage(argv[iRightImg]);
        auto resultPath = std::string(argv[iResultPath]);
        auto costFn = "sad";
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

        // send images
        comms::ImageTransmitter transmitter;
        transmitter.SendImage(leftImg);
        transmitter.SendImage(rightImg);

        // compute depth map on hw
        transmitter.ComputeDepthMap(p1, p2, maxDisp);

        // get result
        Mat depthMap = transmitter.ReceiveImage(leftImg.rows, leftImg.cols);

        // save result
        imwrite(resultPath, depthMap);

        //BuildTestImages();
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }
}
