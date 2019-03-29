using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SgmClient.Comms.Protocol
{
    public enum MessageType
    {
        [Description("PING")]
        Ping,
        [Description("PONG")]
        Pong,

        [Description("IMGS")]
        ImageSendRequest,
        [Description("IMGA")]
        ImageSendAck,

        [Description("IMGF")]
        ImageFragment,
        [Description("IMGR")]
        ImageReceived,
    }

    public struct Message
    {
        public MessageType Type;
        public byte[] Payload;
    }

}
