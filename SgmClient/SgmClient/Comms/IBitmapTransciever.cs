using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace SgmClient.Comms
{
    public interface IBitmapTransciever
    {
        void Connect(string host, int port);

        void TestConnection();

        void Send(System.Drawing.Bitmap image);

        System.Drawing.Bitmap Receive();
    }
}
