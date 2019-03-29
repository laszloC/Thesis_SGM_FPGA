using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SgmClient.Comms.Protocol
{
    public class MessageFactory
    {
        public static Message CreateMessage(MessageType type, params object[] list)
        {
            Message message = new Message() { Type = type };

            switch (type)
            {
                case MessageType.Ping:
                case MessageType.Pong:
                case MessageType.ImageSendAck:
                case MessageType.ImageReceived:
                    message.Payload = null;
                    break;
                case MessageType.ImageSendRequest:
                    var fragments = (int)list[0];
                    message.Payload = Encoding.Default.GetBytes(fragments.ToString());
                    break;
                case MessageType.ImageFragment:
                    var bytes = (byte[])list[0];
                    message.Payload = bytes;
                    break;
                default:
                    throw new ArgumentException($"Type {type.ToString()} not recognized");
            }

        return message;
        }

    }
}
