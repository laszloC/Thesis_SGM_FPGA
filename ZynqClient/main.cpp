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

void TestImageTransmission(const std::string& left, const std::string& right)
{
       comms::ImageTransmitter transmitter = comms::ImageTransmitter();

       Mat img_left = imread(left, IMREAD_GRAYSCALE);
       Mat img_right = imread(right, IMREAD_GRAYSCALE);

       transmitter.SendImage(img_left);

       transmitter.SendImage(img_right);

       Mat res = transmitter.ReceiveImage(img_left.rows, img_left.cols);

       imshow("Negative", res);

       waitKey(10000);
}

int main(int argc, char** argv)
{
    if (argc != 3)
    {
        std::cerr << "Usage:" << std::endl
            << argv[0] << " [Left Image Path] [Right Image Path]" << std::endl;
        return -1;
    }

    try
    {
        TestImageTransmission(argv[1], argv[2]);

        //BuildTestImages();
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }
}
