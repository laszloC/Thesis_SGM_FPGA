#pragma once

#include "stdafx.h"

#include "Socket.h"
#include "Commands.h"

namespace comms
{

class ImageTransmitter
{
public:

    const std::string SEND_ADDRESS = "192.168.1.10";
    const uint16_t SEND_PORT = 50000;

    const std::string RECV_ADDRESS = "192.168.1.20";
    const uint16_t RECV_PORT = 8;

    ImageTransmitter();

    void SendCommand(const Command& Cmd);

    void SendImage(const cv::Mat& Img);

    cv::Mat ReceiveImage(uint32_t H, uint32_t W);

private:

    const uint32_t m_fragSize = 1000;

    Socket m_socket;
};

} // comms
