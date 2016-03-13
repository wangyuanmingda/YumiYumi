using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace yumiyumi.Models
{
    public class DiscountEntity
    {
        public int branch_id;
        public int dish_id;
        public string reason;
        public string starttime;
        public string endtime;
        public int currentprice;
    }
}