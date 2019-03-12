using System;
using System.Drawing;
using System.Text;
using System.Net;
using System.Net.Sockets;
using log4net;

namespace SgmClient.Comms
{
    public class SocketTransciever : IBitmapTransciever
    {
        private static readonly ILog Logger = log4net.LogManager.GetLogger("TestLog");
        private Socket m_socket = null;

        public void Connect(string host, int port)
        {
            IPAddress address = IPAddress.Parse(host);
            IPEndPoint remoteEP = new IPEndPoint(address, port);

            m_socket = new Socket(address.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

            try
            {
                var result = m_socket.BeginConnect(remoteEP, null, null);

                bool success = result.AsyncWaitHandle.WaitOne(500, true);
                if (success)
                {
                    m_socket.EndConnect(result);
                }
                else
                {
                    m_socket.Close();
                    throw new SocketException(10060);
                }

                Logger.Info($"Successfully connected to {address}:{port}");
            }
            catch (Exception)
            {
                Logger.Error("Could not connect to socket");
            }

        }

        public Bitmap Receive()
        {
            throw new NotImplementedException();
        }

        public void Send(Bitmap image)
        {
            throw new NotImplementedException();
        }

        public void TestConnection()
        {
            string testStr = "ping";
            byte[] testBytes = Encoding.ASCII.GetBytes(testStr);

            byte[] bytes = new byte[1024];

            int bytesSent = m_socket.Send(testBytes);

            int bytesRec = m_socket.Receive(bytes);
            var response = Encoding.ASCII.GetString(bytes, 0, bytesRec);
            if (!response.Equals(testStr))
            {
                Logger.Error($"Unexpected response: {response} instead of {testStr}");
                throw new Exception("Unexpected response");
            }
        }
    }
}
