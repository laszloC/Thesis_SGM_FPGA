using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;

namespace SgmClient.Comms.Extensions
{
    public static class SocketExtensions
    {
        public static void TryConnect(this Socket sock, EndPoint ep, int timeout)
        {
            var result = sock.BeginConnect(ep, null, null);
            bool success = result.AsyncWaitHandle.WaitOne(500, true);
            if (success)
            {
                sock.EndConnect(result);
            }
            else
            {
                sock.Close();
                throw new SocketException(10060);
            }
        }
    }
}
