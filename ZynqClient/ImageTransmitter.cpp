#include "stdafx.h"

#include "ImageTransmitter.h"
#include "Exceptions.h"
#include "Commands.h"

namespace comms
{
    ImageTransmitter::ImageTransmitter()
        : m_socket(comms::SocketType::TcpSocket)
    {
        m_socket.Connect(SEND_ADDRESS, SEND_PORT);
    }

    void ImageTransmitter::SendImage(const cv::Mat& Img)
    {
        uint32_t dims[2] = { (uint32_t)Img.rows, (uint32_t)Img.cols };

        uint32_t size = dims[0] * dims[1];
        uint32_t remSize = size;

        std::cout << "Sending image command..." << std::endl;
        SendCommand(Command::CmdReqSendImg);

        std::cout << "Sending image size..." << std::endl;
        m_socket.Send((const char*) dims, sizeof(dims));

        Command recv_cmd;
        m_socket.Recv((char*) &recv_cmd, sizeof(recv_cmd));
        if (recv_cmd != Command::CmdRespRecvImgSize)
            throw ImageException("Error occurred: cannot send image fragments");

        for (uint32_t i = 0; i < size; i += m_fragSize)
        {
            const char* buf = (const char*)(Img.data + i);
            uint32_t sendSize = min(m_fragSize, remSize);
            remSize -= sendSize;
            //std::cout << "Sending image fragment " << i << " of size "<< sendSize << "..." << std::endl;
            m_socket.Send(buf, sendSize);
            m_socket.Recv((char*)& recv_cmd, sizeof(recv_cmd));
            if (recv_cmd != Command::CmdRespRecvFrag)
                throw ImageException("Did not receive acknowledgment");
        }

        std::cout << "Waiting to receive acknowledgment of image transmission" << std::endl;

        m_socket.Recv((char*) &recv_cmd, sizeof(recv_cmd));

        if (recv_cmd != Command::CmdRespRecvImg)
            throw ImageException("Did not receive acknowledgment command");

        std::cout << "Image was successfully transmitted" << std::endl;
    }

    void ImageTransmitter::ComputeDepthMap(const int16_t P1, const int16_t P2, const int16_t MaxDisp, const bool HwAccelerated)
    {
        // send compute depth map command
        if (HwAccelerated) 
            SendCommand(comms::Command::CmdReqCompDepthMapHw);
        else
            SendCommand(comms::Command::CmdReqCompDepthMapSw);

        // send parameters
        SendInt16(P1);
        SendInt16(P2);
    }

    cv::Mat ImageTransmitter::ReceiveImage(uint32_t H, uint32_t W)
    {
        Command cmd{ Command::CmdUnknown };

        std::cout << "Waiting to receive image command..." << std::endl;
        m_socket.Recv((char*)&cmd, sizeof(cmd));
        if (cmd != Command::CmdReqSendImg)
            throw ImageException("Did not receive image command");

        uint32_t dims[2] = { H, W };

        std::cout << "Waiting to receive size of image..." << std::endl;
        m_socket.Recv((char*)&dims, sizeof(dims));

        Mat img = Mat::zeros(dims[0], dims[1], CV_8UC1);

        auto size = dims[0] * dims[1];

        //SendCommand(comms::Command::CmdRespRecvImgSize);

        std::cout << "Waiting for image of size " << size << std::endl;
        uint32_t remSize = size;
        for (uint32_t i = 0; i < size; i += m_fragSize)
        {
            char* buf = (char*)(img.data + i);
            //std::cout << "Waiting for image fragment " << i << std::endl;
            uint32_t recvSize = min(m_fragSize, remSize);
            remSize -= recvSize;

            m_socket.Recv(buf, (int)recvSize);

            SendCommand(comms::Command::CmdRespRecvFrag);
        }

        SendCommand(comms::Command::CmdRespRecvImg);

        ReceiveTimeStats();

        SendCommand(comms::Command::CmdReqStop);

        return img;
    }

    Stats ImageTransmitter::GetTimeStats()
    {
        return m_timeStats;
    }

    void ImageTransmitter::SendCommand(const Command& Cmd)
    {
        m_socket.Send((const char*)& Cmd, sizeof(Cmd));
    }

    void ImageTransmitter::SendInt16(const int16_t X)
    {
        m_socket.Send((const char*)& X, sizeof(int16_t));
    }

    void ImageTransmitter::ReceiveTimeStats()
    {
        m_socket.Recv((char*)&m_timeStats, sizeof(Stats));
    }
}