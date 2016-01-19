using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace yumiyumi.Models
{
    public class OrderEntity
    {
        public int order_id;
        public int user_id;
        public int restaurant_id;
        public String remark;
        public int total_price;
        public List<OrderDetailEntity> dishList = new List<OrderDetailEntity>();
        public int status;
        public String start_time;

    }
}