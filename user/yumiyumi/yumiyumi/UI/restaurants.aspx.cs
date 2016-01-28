using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yumiyumi.Models;
using System.Text;

namespace yumiyumi.UI
{
    public partial class resturants : System.Web.UI.Page
    {
        public string restaurantList;
        protected void Page_Load(object sender, EventArgs e)
        {
            RestaurantsDAO restaurantDAO = new RestaurantsDAO();
            string name = Request.QueryString["search"];
            if (name == null)
            {
                name = "";
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

            List<RestaurantEntity> list = restaurantDAO.getByName(name);
            StringBuilder sb = new StringBuilder();
            for(int i=0;i<list.Count;i++){
                sb.Append("<div class='order-top'>");
                sb.Append("<li class='im-g'><a href='#'><img src='"+list[i].photo+"' class='img-responsive' alt=''></a></li>");
		        sb.Append("<li class='data2'>"+list[i].name+"</h4>");
                sb.Append("<p>"+list[i].location+"</p>");
                sb.Append("<P> "+list[i].description+"</P>");
                sb.Append("</li>");
			    sb.Append("<li class='bt-nn'>");
                sb.Append("<a class='morebtn hvr-rectangle-in' href='shop?restaurantId="+list[i].id+"'>Explore</a>");
                sb.Append("</li>");
			    sb.Append("<div class='clearfix'></div>");
                sb.Append("</div>");
				}

            restaurantList = sb.ToString();
        }
    }
}