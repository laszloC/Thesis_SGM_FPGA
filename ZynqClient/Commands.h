#pragma once

namespace comms
{

enum class Command : uint32_t
{
    CmdUnknown              = 0x0,

    // requests
    CmdReqSendImg           = 0x1,
    CmdReqComptNeg          = 0x2,
    CmdReqCompDepthMapHw    = 0x3,
    CmdReqCompDepthMapSw    = 0x4,
    CmdReqStop              = 0x5,

    // responses
    CmdRespRecvImgSize      = 0x16,
    CmdRespRecvImg          = 0x17,
    CmdRespRecvFrag         = 0x18,
    CmdRespCannotRecv       = 0x19,
};

} // comms
