#pragma once

#include "stdafx.h"

#include "Socket.h"
#include "Commands.h"

namespace comms
{

class ImageTransmitter
{
public:

    ImageTransmitter(const std::string& Address, const std::string& Port);

    //~ImageTransmitter();

    void SendCommand(const Command& Cmd);

    void SendImage(const cv::Mat& Img);

    //cv::Mat ReceiveImage();

private:

    const int m_fragSize = 500;

    Socket m_outSocket;
    //Socket m_inSocket;

    //void CreateSocket(const std::string& Address, const std::string& Port);
};

} // comms
