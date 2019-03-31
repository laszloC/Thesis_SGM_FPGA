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
        int height = Img.rows;      // rows
        int width = Img.cols;       // cols
        int ch = Img.channels();    // channels 3 - color, 1 - gray
        int sz = (int)Img.step;     // number of bytes per row
        int ss = 960;

        int size = height * sz;

        std::cout << "Image size: 0x" << std::hex << std::setw(16) << std::setfill('0') << size << std::endl;

        if (send(m_socket, (const char*)&COMMAND_SEND_IMG, sizeof(COMMAND_SEND_IMG), 0) == SOCKET_ERROR)
            throw SocketException("Failed to send command", WSAGetLastError());

        if (send(m_socket, (const char*)&size, sizeof(int), 0) == SOCKET_ERROR)
            throw SocketException("Failed to send size of image", WSAGetLastError());

        //Sleep(10000);

        for (auto i = 0; i < height; i++)
        {
            for (auto j = 0; j < width; j++)
            {
                const char* buf = (char*)(Img.data + sz * i + j);
                if (send(m_socket, buf, ss, 0) == SOCKET_ERROR)
                    throw SocketException("Failed to send image", WSAGetLastError());
                //Sleep(10000);
            }
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