#pragma once

#include "stdafx.h"

#include "Socket.h"
#include "Commands.h"

namespace comms
{

class ImageTransmitter
{
public:

    const std::string& OUT_ADDRESS = "192.168.1.10";
    const std::string& OUT_PORT = "50000";

    const std::string& IN_ADDRESS = "192.168.1.11";
    const std::string& IN_PORT = "50001";

    ImageTransmitter();

    //~ImageTransmitter();

    void SendCommand(const Command& Cmd);

    void SendImage(const cv::Mat& Img);

    //cv::Mat ReceiveImage();

private:

    const int m_fragSize = 500;

    Socket m_outSocket;
    //Socket m_inSocket;
};

} // comms
