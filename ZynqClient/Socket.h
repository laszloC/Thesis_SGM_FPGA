#pragma once

#include "stdafx.h"

namespace comms
{

enum class SocketType {
    UdpSocket,
    TcpSocket
};

class Socket
{
public:

    Socket(SocketType Type);

    void Bind(const std::string& LocalAddress, const uint16_t LocalPort);

    void Connect(const std::string& RemoteAddress, const uint16_t RemotePort);

    void Send(const char* Buf, const int Len);

    void Recv(char* Buf, const int Len);

    ~Socket();

private:

    SOCKADDR_IN m_remoteAddress;
    SOCKADDR_IN m_localAddress;
    SOCKET m_socket;

    void CreateSocket(SocketType Type);

    void CloseSocket();

};

} // comms

