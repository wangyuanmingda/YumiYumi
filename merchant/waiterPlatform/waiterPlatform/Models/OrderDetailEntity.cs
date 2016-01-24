using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace waiterPlatform.Models
{
    public class OrderDetailEntity
    {
        public int id;
        public int order_id;
        public int dish_id;
        public int count;
        public int status;//表示菜的完成情况
    }
}