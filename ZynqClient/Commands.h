#pragma once

namespace comms
{

enum class Command : uint32_t
{
    CmdUnknown      = 0x0,
    CmdSendImg      = 0x1,
    CmdTestNeg      = 0x2,
    CmdStop         = 0x3,
    CmdRecvImg      = 0x4,
    CmdRecvFrag     = 0x5,
    CmdReadyToRecv  = 0x6,
    CmdCannotRecv   = 0x7,
    CmdCompDepthMap = 0x8,
};

} // comms
