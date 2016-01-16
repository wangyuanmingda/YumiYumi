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