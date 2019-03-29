#pragma once

#include "stdafx.h"

namespace comms
{

class ImageTransmitter
{
public:

    ImageTransmitter(const std::string& Address, const std::string& Port);

    ~ImageTransmitter();

    void SendImage(const cv::Mat& Img);

private:

    SOCKET m_socket;

    void CreateSocket(const std::string& Address, const std::string& Port);
};

} // comms
