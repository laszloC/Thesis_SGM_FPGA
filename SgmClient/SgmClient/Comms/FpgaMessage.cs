using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SgmClient.Comms
{
    public struct MessageHeader
    {
        public Int16 MessageType { get; set; }
        public Int16 SequenceNumber { get; set; }
        public Int32 PayloadSize { get; set; }
    }

    public struct Message
    {
        public MessageHeader Header;
        public byte[] Payload;
    }

}
