using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace SgmClient.Comms.Interfaces
{
    public interface IBitmapTransciever
    {
        void Send(System.Drawing.Bitmap image);

        System.Drawing.Bitmap Receive();
    }
}
