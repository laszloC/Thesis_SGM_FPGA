#pragma once

#include "stdafx.h"

namespace comms
{

class Socket
{
public:

    Socket(const std::string& Address, const std::string& Port);

    void Send(const char* Buf, const int Len);

    void Recv(char* Buf, const int Len);

    ~Socket();

private:

    SOCKET m_socket;

    void CreateSocket(const std::string& Address, const std::string& Port);

    void CloseSocket();

};

} // comms

