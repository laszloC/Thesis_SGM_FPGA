#pragma once

#include "stdafx.h"

#include "Commands.h"

namespace comms
{

class ImageTransmitter
{
public:

    ImageTransmitter(const std::string& Address, const std::string& Port);

    ~ImageTransmitter();

    void SendCommand(const Command& Cmd);

    void SendImage(const cv::Mat& Img);

    cv::Mat ReceiveImage();

private:

    const int m_fragSize = 500;

    SOCKET m_socket;

    void CreateSocket(const std::string& Address, const std::string& Port);
};

} // comms
