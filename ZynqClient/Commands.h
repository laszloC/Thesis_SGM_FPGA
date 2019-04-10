#pragma once

namespace comms
{

enum class Command : int
{
    CmdUnknown          = 0x0,
    CmdSendImage        = 0x1,
    CmdTestNegative     = 0x2,
    CmdStop             = 0x3
};

}