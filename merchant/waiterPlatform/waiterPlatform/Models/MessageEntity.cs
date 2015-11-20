using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace waiterPlatform.Models
{
    public class MessageEntity
    {
        public String message_text;
        public int from_id;
        public int to_id;
        public String ctime;
        public int status;
        public int message_id;
    }
}