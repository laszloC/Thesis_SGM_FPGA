#include "stdafx.h"
#include "UdpSocket.h"

#include "Exceptions.h"

namespace comms
{
    UdpSocket::UdpSocket()
        : m_remoteAddress{ 0 }
        , m_localAddress{ 0 }
        , m_socket{ INVALID_SOCKET }
    {
        CreateSocket();
    }

    void UdpSocket::Bind(const std::string& LocalAddress, const uint16_t LocalPort)
    {
        auto localAddress = inet_addr(LocalAddress.c_str());
        m_localAddress.sin_family = AF_INET;
        m_localAddress.sin_port = htons(LocalPort);
        m_localAddress.sin_addr.s_addr = localAddress;

        if (bind(m_socket, (SOCKADDR*)&m_localAddress, sizeof(m_localAddress)) == SOCKET_ERROR)
            throw SocketException("Failed to bind socket", WSAGetLastError());
    }

    void UdpSocket::Connect(const std::string& RemoteAddress, const uint16_t RemotePort)
    {
        m_remoteAddress.sin_family = AF_INET;
        m_remoteAddress.sin_port = htons(RemotePort);
        m_remoteAddress.sin_addr.s_addr = inet_addr(RemoteAddress.c_str());
    }

    void UdpSocket::Send(const char* Buf, const int Len)
    {
        if (sendto(m_socket, Buf, Len, 0, (const sockaddr*)&m_remoteAddress, sizeof(SOCKADDR_IN)) == SOCKET_ERROR)
            throw SocketException(std::string("Failed to send buffer of length ") + std::to_string(Len), WSAGetLastError());
    }

    void UdpSocket::Recv(char* Buf, const int Len)
    {
        auto r = recv(m_socket, Buf, Len, 0);
        if (r == 0)
            throw SocketException("Connection closed", 0);
        if (r == SOCKET_ERROR)
            throw SocketException("Receive failed", WSAGetLastError());
    }

    UdpSocket::~UdpSocket()
    {
        try
        {
            CloseSocket();
        }
        catch (const std::exception& e)
        {
            std::cerr << e.what() << std::endl;
        }
    }

    void UdpSocket::CloseSocket()
    {
        if (m_socket != INVALID_SOCKET)
        {
            if (closesocket(m_socket) != 0)
                std::cerr << "Failed to close socket with status: " << WSAGetLastError() << std::endl;

            m_socket = INVALID_SOCKET;
        }

        if (WSACleanup() != 0)
            std::cerr << "WSA cleanup failed with status: " << WSAGetLastError() << std::endl;
    }

    void UdpSocket::CreateSocket()
    {
        WSADATA wsaData;

        if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
            throw SocketException("Failed to initialize WinSock", WSAGetLastError());

        m_socket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
        if (m_socket == INVALID_SOCKET)
            throw SocketException("Failed to create socket", WSAGetLastError());

        std::cout << "Created socket" << std::endl;
    }



} // comms
