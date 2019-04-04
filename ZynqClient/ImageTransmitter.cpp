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

    void ImageTransmitter::SendImage(const cv::Mat& Img)
    {
        int dims[2] = { Img.rows, Img.cols };
        int stepSize = (int)Img.step[0];
        int fragSize = 500;

        int size = dims[0] * stepSize;
        int remSize = size;

        Command cmd = Command::CmdSendImage;
        std::cout << "Image size: 0x" << std::hex << std::setw(16) << std::setfill('0') << size << std::endl;

        if (send(m_socket, (const char*)&cmd, sizeof(cmd), 0) == SOCKET_ERROR)
            throw SocketException("Failed to send command", WSAGetLastError());

        if (send(m_socket, (const char*)dims, sizeof(dims), 0) == SOCKET_ERROR)
            throw SocketException("Failed to send image dimensions", WSAGetLastError());

        for (auto i = 0; i < size; i += fragSize)
        {
            //Sleep(500);
            const char* buf = (char*)(Img.data + i);
            int sendSize = min(fragSize, remSize);
            remSize -= fragSize;
            if (send(m_socket, buf, sendSize, 0) == SOCKET_ERROR)
                throw SocketException("Failed to send image", WSAGetLastError());
        }
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
        hints.ai_socktype = SOCK_STREAM;
        hints.ai_protocol = IPPROTO_TCP;

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

        if (m_socket == INVALID_SOCKET)
        {
            throw SocketException(ssError.str(), status);
        }

    }

}