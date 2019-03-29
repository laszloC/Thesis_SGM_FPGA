using System;
using SgmClient.Comms.Interfaces;
using SgmClient.Comms.Extensions;
using System.Net;
using System.Net.Sockets;
using log4net;
using SgmClient.Comms.Protocol;
using System.Runtime.InteropServices;

namespace SgmClient.Comms.Impl
{
    class ConnectionException : Exception
    {
        public ConnectionException(string message) : base(message){ }
    }

    class SocketConnection : IFpgaConnection
    {
        private const int MAX_MESSAGE = 1024 + 64;

        private static readonly ILog log = log4net.LogManager.GetLogger(nameof(SocketConnection));

        private readonly Socket socket = null;

        public int MaxPayload => MAX_MESSAGE - Marshal.SizeOf(typeof(MessageHeader));

        public SocketConnection(string host, int port)
        {
            socket = CreateConnection(host, port);
        }

        public void Send(Message message)
        {
            var bytes = MessageSerializer.GetBytes(message);
            socket.Send(bytes);
        }

        public Message Receive()
        {
            byte[] bytes = new byte[MAX_MESSAGE];
            var bytesRec = socket.Receive(bytes);
            return MessageSerializer.GetMessage(bytes, bytesRec);
        }

        public bool TestConnection()
        {
            bool success = true;

            try
            {
                Message sendMessage = MessageFactory.CreateMessage(MessageType.Ping);

                Send(sendMessage);

                Message recv = Receive();

                if (recv.Header.Type != MessageType.Pong)
                {
                    throw new ConnectionException("Pong message was not received");
                }
            }
            catch (Exception e)
            {
                log.Error($"Could not verify connection. Ex: {e.Message}");
                success = false;
            }

            return success;
        }

        private Socket CreateConnection(string host, int port)
        {
            IPAddress address = IPAddress.Parse(host);
            IPEndPoint remoteEP = new IPEndPoint(address, port);

            var sock = new Socket(address.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

            try
            {
                sock.TryConnect(remoteEP, 500);
                sock.SendTimeout = 500;
                sock.ReceiveTimeout = 1000;
            }
            catch (Exception e)
            {
                log.Error($"Failed to connect to {address} : {port}. Ex: {e.Message}");
                throw new ConnectionException("Failed to connect to endpoint.");
            }

            return sock;
        }
    }
}
