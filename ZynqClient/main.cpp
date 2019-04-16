// OpenCVApplication.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "common.h"

#include "Commands.h"
#include "ImageTransmitter.h"

const std::string m_board_host = "192.168.1.10";
const std::string m_board_port = "50000";

//const std::string m_pc_host = "192.168.1.20";
//const std::string m_pc_port = "50001";

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
        comms::ImageTransmitter transmitter = comms::ImageTransmitter(m_board_host, m_board_port);

        // start by sending the left image only and expect to get it back
        Mat img_left = imread(argv[1], IMREAD_GRAYSCALE);
        Mat img_right = imread(argv[2], IMREAD_GRAYSCALE);

        transmitter.SendImage(img_left);

        transmitter.SendImage(img_right);

        //Mat res = transmitter.ReceiveImage();

        //imshow("Negative", res);
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }
}
