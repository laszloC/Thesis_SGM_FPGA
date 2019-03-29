using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;
using SgmClient.Comms.Protocol;

namespace SgmClient.Comms.Extensions
{
    public static class MessageSerializer
    {
        public static string Serialize(Message message)
        {
            StringBuilder sb = new StringBuilder(message.Type.GetValueAsString());

            sb.Append(message.Payload);

            return sb.ToString();
        }

        public static byte[] GetBytes(Message message)
        {
            using (var ms = new MemoryStream())
            {
                var bf = new BinaryFormatter();
                bf.Serialize(ms, message);
                return ms.ToArray();
            }
        }

        public static Message GetMessage(byte[] bytes, int length)
        {
            using (var ms = new MemoryStream())
            {
                var bf = new BinaryFormatter();
                ms.Write(bytes, 0, length);
                ms.Seek(0, SeekOrigin.Begin);
                var obj = bf.Deserialize(ms);
                return (Message)obj;
            }
        }

        private static string GetValueAsString(this MessageType value)
        {
            var field = value.GetType().GetField(value.ToString());
            var customAttributes = field.GetCustomAttributes(typeof(DescriptionAttribute), false);

            if (customAttributes.Length > 0)
            {
                return (customAttributes[0] as DescriptionAttribute).Description;
            }
            else
            {
                return value.ToString();
            }
        }
    }
}
