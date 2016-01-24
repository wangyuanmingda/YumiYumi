using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace waiterPlatform.Models
{
    public class DishEntity
    {
        public int id;
        public string dish_name;
        public string photo;
        public int brand_id;
        public string description;
        public int price;
        public int type_id;
        public string type_name;

        public int status;
        public int count;
    }
}