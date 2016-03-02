using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace yumiyumi.Models
{
    public class ServiceEntity
    {
        public int id;
        public int user_id;
        public int restaurant_id;
        public int service_type;
        public String ctime;
        public int status;

        public String service_name;
    }
}