using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace yumiyumi.Models
{
    public class OrderDetailEntity
    {
        public int id;
        public int order_id;
        public int dish_id;
        public int count;
        public int price;//存储实际价格，可能为打折价可能为菜单价
    }
}