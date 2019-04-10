#include "stdafx.h"

#include "ImageTransmitter.h"
#include "Exceptions.h"
#include "Commands.h"

namespace comms
{
    ImageTransmitter::ImageTransmitter(const std::string& Address, const std::string& Port)
    {
        CreateSocket(Address, Port);
    }

    ImageTransmitter::~ImageTransmitter()
    {
        if (m_socket != INVALID_SOCKET)
        {
            if (closesocket(m_socket) != 0)
                std::cerr << "closesocket failed with status" << WSAGetLastError() << std::endl;
            m_socket = INVALID_SOCKET;
        }

        if (WSACleanup() != 0)
            std::cerr << "WSACleanup failed with status " << WSAGetLastError() << std::endl;
    }

    void ImageTransmitter::SendCommand(const Command& Cmd)
    {
        if (send(m_socket, (char*)&Cmd, sizeof(Cmd), 0) == SOCKET_ERROR)
            throw SocketException("Failed to send command", WSAGetLastError());
    }

    void ImageTransmitter::SendImage(const cv::Mat& Img)
    {
        int dims[2] = { Img.rows, Img.cols };
        int stepSize = (int)Img.step[0];

        int size = dims[0] * stepSize;
        int remSize = size;

        //std::cout << "Image size: 0x" << std::hex << std::setw(16) << std::setfill('0') << size << std::endl;

        Command cmd = Command::CmdSendImage;

        SendCommand(cmd);

        if (send(m_socket, (const char*)dims, sizeof(dims), 0) == SOCKET_ERROR)
            throw SocketException("Failed to send image dimensions", WSAGetLastError());

        for (auto i = 0; i < size; i += m_fragSize)
        {
            //Sleep(10);
            const char* buf = (char*)(Img.data + i);
            int sendSize = min(m_fragSize, remSize);
            remSize -= m_fragSize;
            if (send(m_socket, buf, sendSize, 0) == SOCKET_ERROR)
                throw SocketException("Failed to send image", WSAGetLastError());
        }
    }

    cv::Mat ImageTransmitter::ReceiveImage()
    {
        SendCommand(comms::Command::CmdTestNegative);

        std::cout << "Receive image" << std::endl;

        int dims[2] = { 0, 0 };

        Command cmd{ Command::CmdUnknown };

        std::cout << "Should receive command" << std::endl;
        auto r = recv(m_socket, (char*)&cmd, sizeof(cmd), 0);
        if (r == 0)
            throw SocketException("Connection closed", 0);
        if (r == SOCKET_ERROR)
            throw SocketException("Failed to receive command", WSAGetLastError());

        if (cmd != Command::CmdSendImage)
            throw ImageException("Did not get receive send image command");
        std::cout << "Received command" << std::endl;

        std::cout << "Should receive size of image" << std::endl;
        r = recv(m_socket, (char*)dims, sizeof(dims), 0);
        if (r == 0)
            throw SocketException("Connection closed", 0);
        if (r == SOCKET_ERROR)
            throw SocketException("Failed to receive image", WSAGetLastError());
        std::cout << "Received image size" << std::endl;

        Mat img = Mat::zeros(dims[0], dims[1], CV_8UC1);

        auto size = dims[0] * dims[1];
        auto remSize = size;

        std::cout << "Should receive image" << std::endl;
        for (auto i = 0; i < size; i++)
        {
            //Sleep(10);

            char* buf = ((char*)img.data + i);
            int recvSize = min(m_fragSize, remSize);
            remSize -= m_fragSize;

            r = recvfrom(m_socket, buf, recvSize, 0, NULL, 0);
            if (r == 0)
                throw SocketException("Connection closed", 0);
            if (r == SOCKET_ERROR)
                throw SocketException("Failed to receive image fragment", WSAGetLastError());
            std::cout << "Received image fragment " << i << std::endl;
        }

        return img;
    }

    void ImageTransmitter::CreateSocket(const std::string& Address, const std::string& Port)
    {
        WSADATA wsaData;

        if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
        {
            //std::cerr << "WSAStartup failed with status " << status << std::endl;
            throw SocketException("Failed to initialize WinSock", WSAGetLastError());
        }

        LPADDRINFO result = nullptr;
        LPADDRINFO ptr = nullptr;
        ADDRINFO hints;

        std::stringstream ssError;

        ZeroMemory(&hints, sizeof(hints));
        hints.ai_family = AF_INET;
        hints.ai_socktype = SOCK_DGRAM;
        hints.ai_protocol = IPPROTO_UDP;

        uint32_t status = getaddrinfo(Address.c_str(), Port.c_str(), &hints, &result);
        if (status != 0)
        {
            //std::cerr << "getaddrinfo failed with status 0x" << status << std::endl;
            throw SocketException("Failed to get address info", status);
        }

        for (ptr = result; ptr != nullptr; ptr = ptr->ai_next)
        {
            m_socket = socket(ptr->ai_family, ptr->ai_socktype, ptr->ai_protocol);
            if (m_socket == INVALID_SOCKET)
            {
                ssError << "Failed to create socket";
                status = WSAGetLastError();
                break;
            }

            status = connect(m_socket, ptr->ai_addr, (int)ptr->ai_addrlen);
            if (status == SOCKET_ERROR)
            {
                status = WSAGetLastError();
                closesocket(m_socket);
                m_socket = INVALID_SOCKET;
                continue;
            }

            break;
        }

        freeaddrinfo(result);

        std::string test = "test";

        send(m_socket, test.c_str(), (int)test.size(), 0);

        if (m_socket == INVALID_SOCKET)
        {
            throw SocketException(ssError.str(), status);
        }

    }

}