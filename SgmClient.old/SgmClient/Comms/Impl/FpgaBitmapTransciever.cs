using System;
using System.Drawing;
using System.Text;
using System.Net;
using System.Net.Sockets;
using log4net;
using SgmClient.Comms.Interfaces;
using SgmClient.Comms.Extensions;
using SgmClient.Comms.Protocol;

namespace SgmClient.Comms.Impl
{
    public class TransmissionException : Exception
    {
        public TransmissionException(string message) : base(message) { }
    }

    public class FpgaBitmapTransciever : IBitmapTransciever
    {
        private static readonly ILog Logger = log4net.LogManager.GetLogger("TestLog");

        private readonly IFpgaConnection connection;

        public FpgaBitmapTransciever(IFpgaConnection connection)
        {
            this.connection = connection;
        }

        public Bitmap Receive()
        {
            throw new NotImplementedException();
        }

        public void Send(Bitmap image)
        {
            var bytes = ImageSerializer.GetBytes(image);

            var fragmentSize = connection.MaxPayload;
            var fragments = (int)Math.Ceiling((double)bytes.Length / fragmentSize);

            var message = MessageFactory.CreateMessage(MessageType.ImageSendRequest, fragments);
            connection.Send(message);

            message = connection.Receive();
            if (message.Header.Type != MessageType.ImageSendAck)
                throw new TransmissionException("Did not receive image send ack");

            for (var i = 0; i < fragments; i++)
            {
                var startIndex = i * fragmentSize;
                var length = Math.Min(bytes.Length - (i * fragmentSize), bytes.Length);
                message = MessageFactory.CreateMessage(MessageType.ImageFragment, bytes.SubArray(startIndex, length));
            }

            message = connection.Receive();
            if (message.Header.Type != MessageType.ImageReceived)
                throw new TransmissionException("Did not received image receive confirmation");
        }
    }
}
