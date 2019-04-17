#pragma once

#include "stdafx.h"

namespace comms
{

class SocketException : public std::exception
{
public:

    std::string m_message;
    uint32_t m_status;

    SocketException(const std::string& Message, const uint32_t Status)
        : std::exception()
        , m_message(Message)
        , m_status(Status)
    {

    };

    SocketException(const std::string& Message)
        : SocketException(Message, (uint32_t)-1)
    {

    }

    char const* what() const
    {
        std::stringstream ss;

        ss << m_message << ". Status: 0x" << m_status;

        return ss.str().c_str();
    }
};

class ImageException : public std::exception
{
public: ImageException(char const* const Message) : std::exception(Message) {}
};

} // comms
