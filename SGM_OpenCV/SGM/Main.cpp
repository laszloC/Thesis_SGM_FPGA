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

Mat OpenGrayscaleImage()
{
    char fileName[MAX_PATH];

    if (!openFileDlg(fileName))
    {
        throw std::exception("Cannot open file");
    }

    return imread(fileName, CV_LOAD_IMAGE_GRAYSCALE);
}

int main()
{
    // read images
    auto leftImg = OpenGrayscaleImage();
    auto rightImg = OpenGrayscaleImage();

    SgmMatcher matcher(leftImg, rightImg);

    Mat depthMap = matcher.ComputeDepthMap() * 20;

    imshow("Depth map", depthMap);

    waitKey();
}