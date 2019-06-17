#include "stdafx.h"
#include "Socket.h"

#include "Exceptions.h"

namespace comms
{
    Socket::Socket(SocketType Type)
        : m_remoteAddress{ 0 }
        , m_localAddress{ 0 }
        , m_socket{ INVALID_SOCKET }
    {
        CreateSocket(Type);
    }

    void Socket::Bind(const std::string& LocalAddress, const uint16_t LocalPort)
    {
        m_localAddress.sin_family = AF_INET;
        m_localAddress.sin_port = htons(LocalPort);
        m_localAddress.sin_addr.s_addr = inet_addr(LocalAddress.c_str());

        if (bind(m_socket, (SOCKADDR*)&m_localAddress, sizeof(m_localAddress)) == SOCKET_ERROR)
            throw SocketException("Failed to bind socket", WSAGetLastError());
    }

    void Socket::Connect(const std::string& RemoteAddress, const uint16_t RemotePort)
    {
        m_remoteAddress.sin_family = AF_INET;
        m_remoteAddress.sin_port = htons(RemotePort);
        m_remoteAddress.sin_addr.s_addr = inet_addr(RemoteAddress.c_str());

        if (connect(m_socket, (SOCKADDR*)& m_remoteAddress, sizeof(m_remoteAddress)) == SOCKET_ERROR)
            throw SocketException("Failed to connect to remote address", WSAGetLastError());
    }

    void Socket::Send(const char* Buf, const int Len)
    {
        if (sendto(m_socket, Buf, Len, 0, (const sockaddr*)&m_remoteAddress, sizeof(SOCKADDR_IN)) == SOCKET_ERROR)
            throw SocketException(std::string("Failed to send buffer of length ") + std::to_string(Len), WSAGetLastError());
    }

    void Socket::Recv(char* Buf, const int Len)
    {
        auto r = recv(m_socket, Buf, Len, 0);
        if (r == 0)
            throw SocketException("Connection closed", 0);
        if (r == SOCKET_ERROR)
            throw SocketException("Receive failed", WSAGetLastError());
    }

    Socket::~Socket()
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

    void Socket::CloseSocket()
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

    void Socket::CreateSocket(SocketType Type)
    {
        WSADATA wsaData;

        if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
            throw SocketException("Failed to initialize WinSock", WSAGetLastError());

        int protocol = 0;
        int type = 0;

        switch (Type)
        {
        case comms::SocketType::UdpSocket:
            protocol = IPPROTO_UDP;
            type = SOCK_DGRAM;
            break;
        case comms::SocketType::TcpSocket:
            protocol = IPPROTO_TCP;
            type = SOCK_STREAM;
            break;
        default:
            break;
        }

        m_socket = socket(AF_INET, type, protocol);
        if (m_socket == INVALID_SOCKET)
            throw SocketException("Failed to create socket", WSAGetLastError());

        std::cout << "Created socket" << std::endl;
    }



} // comms
