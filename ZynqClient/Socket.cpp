#include "stdafx.h"
#include "Socket.h"

#include "Exceptions.h"

namespace comms
{
    Socket::Socket(const std::string& Address, const std::string& Port)
        : m_socket{ INVALID_SOCKET }
    {
        CreateSocket(Address, Port);
    }

    void Socket::Send(const char* Buf, const int Len)
    {
        if (send(m_socket, Buf, Len, 0) == SOCKET_ERROR)
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

    void Socket::CreateSocket(const std::string& Address, const std::string& Port)
    {
        WSADATA wsaData;

        if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
            throw SocketException("Failed to initialize WinSock", WSAGetLastError());

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
            throw SocketException("Failed to get address info", status);

        for (ptr = result; ptr != nullptr; ptr = ptr->ai_next)
        {
            m_socket = socket(ptr->ai_family, ptr->ai_socktype, ptr->ai_protocol);
            if (m_socket == INVALID_SOCKET)
            {
                ssError << "Failed to crate socket";
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

        std::string first = "first";

        send(m_socket, first.c_str(), (int)first.size(), 0);

        if (m_socket == INVALID_SOCKET)
            throw SocketException(ssError.str(), status);
    }

    void Socket::CloseSocket()
    {
        if (m_socket != INVALID_SOCKET)
        {
            if (closesocket(m_socket) != 0)
            {
                throw SocketException("Failed to close socket", WSAGetLastError());
            }
            m_socket = INVALID_SOCKET;
        }

        if (WSACleanup() != 0)
            throw SocketException("WSACleanup failed", WSAGetLastError());
    }

} // comms
