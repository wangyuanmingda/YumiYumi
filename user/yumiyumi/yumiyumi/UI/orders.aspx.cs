using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yumiyumi.Models;

namespace yumiyumi.UI
{
    public partial class orders : System.Web.UI.Page
    {
        public string dishList;
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            string id = Request.QueryString["restaurantId"];
            if (id == null)
            {
                id = "";
            }
            RestaurantsDAO restaurantDAO = new RestaurantsDAO();
            List<DishEntity> disheslist = restaurantDAO.getById(id);
            int type_count = restaurantDAO.getTypeCount(id);
            int jj = 0;
            int kk = 0;
            while(jj<disheslist.Count)
            {
                sb.Append("<div class='order-top'>");
                sb.Append("<li class='data'><h4>"+disheslist[jj].type_name+"</h4>");
                while (disheslist[kk].type_id == disheslist[jj].type_id && kk < disheslist.Count)
                {
                    sb.Append("<p>"+disheslist[kk].dish_name+"</p>");
                    kk++;
                    if (kk == disheslist.Count) break;
                }
                kk = jj;
                sb.Append("</li>");
                sb.Append("<li class='data'>");
                sb.Append("<div class='special-info grid_1 simpleCart_shelfItem'>");
                sb.Append("<h4>价格</h4>");
                while(disheslist[kk].type_id== disheslist[jj].type_id && kk<disheslist.Count)
                {
                    sb.Append("<div class='pre-top'>");
                    sb.Append("<div class='pr-left'>");
                    sb.Append("<div class='item_add'><span  class='item_price'><h6>ONLY $" + disheslist[kk].price + ".00</h6></span></div>");
                    sb.Append("</div>");
                    sb.Append("<div class='pr-right'>");
                    sb.Append("<div class='item_add'><span id='a" + disheslist[kk].id + "' onclick='addtocart(this)' class='item_price'><a href='#'>来一份</a></span></div>");
                    sb.Append("</div>");
                    sb.Append("<div class='clearfix'></div>");
                    sb.Append("</div>");
                    kk++;
                    if (kk == disheslist.Count) break;
                }
                jj = kk;
                sb.Append("</div>");
                sb.Append("</li>");
				sb.Append("<div class='clearfix'></div>");
                sb.Append("</div>");
                sb.Append("");
            }
            dishList = sb.ToString();
        }
    }
}