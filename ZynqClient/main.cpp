// OpenCVApplication.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "common.h"

#include "ImageTransmitter.h"

const std::string m_host = "192.168.1.10";
const std::string m_port = "7";

int main(int argc, char** argv)
{
    if (argc != 3)
    {
        std::cerr << "Usage:" << std::endl
            << argv[0] << " [Left Image Path] [Right Image Path]" << std::endl;
        return -1;
    }

    comms::ImageTransmitter transmitter = comms::ImageTransmitter(m_host, m_port);

    // start by sending the left image only and expect to get it back
    Mat img_left = imread(argv[1]);

    transmitter.SendImage(img_left);
}
