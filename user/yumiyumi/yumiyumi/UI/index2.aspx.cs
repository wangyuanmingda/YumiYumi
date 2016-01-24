using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace yumiyumi.UI
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((Request.QueryString["deskId"] != null)&&(Request.QueryString["restaurantId"] != null))
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
            
        }

        public Boolean AddToCart(int id)
        {
            HttpCookie cookie = Request.Cookies["yumiyumi_cart"];
            cookie.Values["count"] = Convert.ToString(Convert.ToInt32(cookie.Values["count"])+1);
            cookie.Values["id"] = Convert.ToString(id);
            Response.Write(Request.Cookies["yumiyumi_cart"].Value);
            return true;
        }
    }
}