using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SgmClient.Comms.Protocol;

namespace SgmClient.Comms.Interfaces
{
    public interface IFpgaConnection
    {
        int MaxPayload { get; }

        void Send(Message message);

        Message Receive();

        bool TestConnection();
    }
}
