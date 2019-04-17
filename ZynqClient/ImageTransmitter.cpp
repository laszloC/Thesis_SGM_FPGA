#include "stdafx.h"

#include "ImageTransmitter.h"
#include "Exceptions.h"
#include "Commands.h"

namespace comms
{
    ImageTransmitter::ImageTransmitter()
        : m_outSocket(OUT_ADDRESS, OUT_PORT)
    {
    }

    void ImageTransmitter::SendCommand(const Command& Cmd)
    {
        m_outSocket.Send((const char*)&Cmd, sizeof(Cmd));
    }

    void ImageTransmitter::SendImage(const cv::Mat& Img)
    {
        int dims[2] = { Img.rows, Img.cols };
        int stepSize = (int)Img.step[0];

        int size = dims[0] * stepSize;
        int remSize = size;

        //std::cout << "Image size: 0x" << std::hex << std::setw(16) << std::setfill('0') << size << std::endl;

        std::cout << "Sending image command..." << std::endl;
        SendCommand(Command::CmdSendImage);

        std::cout << "Sending image size..." << std::endl;
        m_outSocket.Send((const char*)dims, sizeof(dims));

        for (auto i = 0; i < size; i += m_fragSize)
        {
            //Sleep(10);
            const char* buf = (char*)(Img.data + i);
            int sendSize = min(m_fragSize, remSize);
            remSize -= m_fragSize;
            std::cout << "Sending image fragment " << i << "..." << std::endl;
            m_outSocket.Send(buf, sendSize);
        }
    }

    //cv::Mat ImageTransmitter::ReceiveImage()
    //{
    //    SendCommand(comms::Command::CmdTestNegative);

    //    //std::cout << "Receive image" << std::endl;

    //    int dims[2] = { 0, 0 };

    //    Command cmd{ Command::CmdUnknown };

    //    std::cout << "Should receive command" << std::endl;
    //    m_outSocket.Recv((char*)& cmd, sizeof(cmd));
    //    if (cmd != Command::CmdSendImage)
    //        throw ImageException("Did not get receive send image command");
    //    std::cout << "Received command" << std::endl;

    //    std::cout << "Should receive size of image" << std::endl;
    //    m_outSocket.Recv((char*)dims, sizeof(dims));

    //    Mat img = Mat::zeros(dims[0], dims[1], CV_8UC1);

    //    auto size = dims[0] * dims[1];
    //    auto remSize = size;

    //    std::cout << "Should receive image" << std::endl;
    //    for (auto i = 0; i < size; i++)
    //    {
    //        //Sleep(10);

    //        char* buf = ((char*)img.data + i);
    //        int recvSize = min(m_fragSize, remSize);
    //        remSize -= m_fragSize;

    //        r = recvfrom(m_outSocket, buf, recvSize, 0, NULL, 0);
    //        if (r == 0)
    //            throw SocketException("Connection closed", 0);
    //        if (r == SOCKET_ERROR)
    //            throw SocketException("Failed to receive image fragment", WSAGetLastError());
    //        std::cout << "Received image fragment " << i << std::endl;
    //    }

    //    return img;
    //}

}