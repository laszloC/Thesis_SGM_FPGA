#pragma once

#include "stdafx.h"

#include "UdpSocket.h"
#include "Commands.h"

namespace comms
{

class ImageTransmitter
{
public:

    const std::string SEND_ADDRESS = "172.16.20.10";
    const uint16_t SEND_PORT = 5000;

    const std::string RECV_ADDRESS = "172.16.32.40";
    const uint16_t RECV_PORT = 5001;

    ImageTransmitter();

    void SendCommand(const Command& Cmd);

    void SendImage(const cv::Mat& Img);

    cv::Mat ReceiveImage(int H, int W);

private:

    const int m_fragSize = 1400;

    UdpSocket m_outSocket;
    UdpSocket m_inSocket;
};

} // comms
