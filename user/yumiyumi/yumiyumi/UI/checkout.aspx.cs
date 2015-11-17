using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace yumiyumi.UI
{
    public partial class checkout : System.Web.UI.Page
    {
        public string shopping_cart;
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Request.Cookies.Count; i++)
            {
   
                string name = Request.Cookies[i].Name;
                if (name.Length >= 13 && Request.Cookies[i].Value!="null")
                {
                    string id = name.Substring(13, name.Length - 13);
                    string logo = name.Substring(0, 13);
                    if (logo.Equals("yumiyumi_cart"))
                    {
                        Response.Write("Cookie[" + i + "]的Name为：" + id + "<br/>\n");
                        Response.Write("Cookie[" + i + "]的Value为：" + Request.Cookies[i].Value.ToString() + "<br/>\n");
                        sb.Append("<script>$(document).ready(function (c) {");
                        sb.Append("$('#close" + i + "').on('click', function (c) {");
                        sb.Append("$.cookie('"+name+"', '', { expires: -1 });");
                        sb.Append("$('#cart-header" + i + "').fadeOut('slow', function (c) {");
                        sb.Append("$('#cart-header" + i + "').remove();");
                        sb.Append("});");
                        sb.Append("});");
                        sb.Append("});");
                        sb.Append("</script>\n");
                        sb.Append("<div id='cart-header" + i + "'class='cart-header3'>\n");
                        sb.Append("<div id='close" + i + "' class='close3'> </div>\n");
                        sb.Append("<div class='cart-sec simpleCart_shelfItem'>\n");
                        sb.Append("<div class='cart-item cyc'>\n");
                        sb.Append("<img src='images/5p.jpg' class='img-responsive' alt=''>\n");
                        sb.Append("</div>\n");
                        sb.Append("<div class='cart-item-info'>\n");
                        sb.Append("<h3><a href='#'> Lorem Ipsum is not simply </a><span>Pickup time:</span></h3>\n");
                        sb.Append("<ul class='qty'>\n");
                        sb.Append("<li><p>Min. order value:</p></li>\n");
                        sb.Append("<li><p>FREE delivery</p></li>\n");
                        sb.Append("</ul>\n");
                        sb.Append("<div class='delivery'>\n");
                        sb.Append("<p>Service Charges : $10.00</p>\n");
                        sb.Append("<span>Delivered in 1-1:30 hours</span>\n");
                        sb.Append("<div class='clearfix'></div>\n");
                        sb.Append("</div>\n");
                        sb.Append("</div>\n");
                        sb.Append("<div class='clearfix'></div>\n");
                        sb.Append("</div>\n");
                        sb.Append("</div>\n");
                    }
                }
            }
            shopping_cart = sb.ToString();
        }
    }
}