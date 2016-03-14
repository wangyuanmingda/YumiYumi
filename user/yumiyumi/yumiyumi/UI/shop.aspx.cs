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
        public string restaurantName;
        public int price;//用来存放价格，因为有单价与优惠价之分。
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            string id = Request.QueryString["restaurantId"];
            if (id == null)
            {
                id = "";
            }

            if ((Request.QueryString["deskId"] != null) && (Request.QueryString["restaurantId"] != null))
            {
                HttpCookie cook = new HttpCookie("deskId", Request.QueryString["deskId"].ToString());//新建一个cookie对象
                HttpCookie cookie = new HttpCookie("restaurantId", Request.QueryString["restaurantId"].ToString());//新建一个cookie对象
                Response.Cookies.Add(cook);
                Response.Cookies.Add(cookie);
            }
            else
            {
                HttpCookie cook = new HttpCookie("deskId", "1");//新建一个cookie对象
                HttpCookie cookie = new HttpCookie("restaurantId", "1");//新建一个cookie对象
            }
            RestaurantsDAO restaurantDAO = new RestaurantsDAO();
            DiscountDAO discountDAO = new DiscountDAO();
            List<DishEntity> disheslist = restaurantDAO.getDishListById(id);
            RestaurantEntity restaurant = restaurantDAO.getById(id);
           
            restaurantName = restaurant.name;
            int type_count = restaurantDAO.getTypeCount(id);
            int jj = 0;
            int kk = 0;
            while(jj<disheslist.Count)//总共有disheslist.Count个菜
            {
                sb.Append("<div class='order-top'>");
                sb.Append("<li style='width:30%' class='data'><h4>"+disheslist[jj].type_name+"</h4>");
                while (disheslist[kk].type_id == disheslist[jj].type_id && kk < disheslist.Count)//这是干嘛的，输出菜名，按列来搞
                {
                    sb.Append("<p>"+disheslist[kk].dish_name+"</p>");
                    kk++;
                    if (kk == disheslist.Count) break;
                }
                kk = jj;
                sb.Append("</li>");
                sb.Append("<li style='width:60%' class='data'>");
                sb.Append("<div class='special-info grid_1 simpleCart_shelfItem'>");
                sb.Append("<h4>价格</h4>");
                while(disheslist[kk].type_id== disheslist[jj].type_id && kk<disheslist.Count)
                {
                    DiscountEntity discount = discountDAO.getDiscountById(disheslist[kk].id);
                    
                    sb.Append("<div class='pre-top'>");
                    sb.Append("<div class='pr-left'>");
                    if (discount.reason != null)
                    {
                        price = discount.currentprice;
                        sb.Append("<div class='item_add'><span  class='item_price'><h6 style='text-decoration:line-through;float:left;'> ￥" + disheslist[kk].price + ".00</h6>");
                        sb.Append("<h6 style='float:right;'>ONLY ￥"+ price+"</h6></span></div>");
                    }
                    else
                    {
                        sb.Append("<div class='item_add'><span  class='item_price'><h6>ONLY ￥" + disheslist[kk].price + ".00</h6></span></div>");
                        price = disheslist[kk].price;
                     }       
                    sb.Append("</div>");
                    sb.Append("<div class='pr-right'>");
                    sb.Append("<div class='item_add'><span id='a" + disheslist[kk].id + "' onclick='addtocart(this,0,"+  price + ")' class='item_price'><a href='#'>来一份</a></span></div>");//此处为了得到菜品单价，直接添加了单价作为参数。
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