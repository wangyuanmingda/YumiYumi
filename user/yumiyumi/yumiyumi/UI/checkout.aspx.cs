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
    public partial class checkout : System.Web.UI.Page
    {
        public string shopping_cart;
        public int shopping_count;
        public int total_price;
        public int every_price;
        public string commitOrder;
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            DishDAO dishDAO = new DishDAO();
            shopping_count = 0;
            total_price = 0;
            every_price = 0;
            for (int i = 0; i < Request.Cookies.Count; i++)
            {
   
                string name = Request.Cookies[i].Name;
                if (name.Length >= 13 && Request.Cookies[i].Value!="null")
                {
                    string id = name.Substring(13, name.Length - 13);
                    string logo = name.Substring(0, 13);
                    if (logo.Equals("yumiyumi_cart"))
                    {
                        shopping_count++;
                        DishEntity temp = dishDAO.getDishById(Convert.ToInt32(id));
                        string eachcookie = System.Web.HttpUtility.UrlDecode(Request.Cookies[i].Value.ToString());
                        string[] quantity = eachcookie.Split(';');
                        int q = Convert.ToInt32(quantity[0].Split(':')[1]);
                        total_price += q * temp.price;
                        every_price = q * temp.price;
                        Response.Write("Cookie[" + i + "]的Name为：" + id + "<br/>\n");
                        Response.Write("Cookie[" + i + "]的Value为：" + Request.Cookies[i].Value.ToString() + "<br/>\n");
                        sb.Append("<script>$(document).ready(function (c) {");
                        sb.Append("$('#close" + id +"').on('click', function (c) {");
                        sb.Append("$.cookie('"+name+"', '', { expires: -1 });");
                        sb.Append("$('#cart-header" + i + "').fadeOut('slow', function (c) {");
                        sb.Append("$('#cart-header" + i + "').remove();");
                        sb.Append("});");
                        sb.Append("});");
                        sb.Append("});");
                        sb.Append("</script>\n");
                        sb.Append("<div id='cart-header" + i + "'class='cart-header3'>\n");
                        sb.Append("<div id='close" + id + "' class='close3' onclick='deletepart(this)'> </div>\n");
                        sb.Append("<div class='cart-sec simpleCart_shelfItem'>\n");
                        sb.Append("<div class='cart-item cyc'>\n");
                        sb.Append("<img src='images/5p.jpg' class='img-responsive' alt=''>\n");//菜的图片
                        sb.Append("</div>\n");
                        sb.Append("<div class='cart-item-info'>\n");
                        sb.Append("<h3><a href='#'>"+temp.dish_name+"</a> </h3>\n");
                        sb.Append("<ul class='qty'>\n");
                        sb.Append("<li><p>单价:" + temp.price + "</p></li>\n"); //单价
                        sb.Append("</ul>\n");
                        sb.Append("<div style='float:left;width:30%'><span id=q" + id +" style='float:left;padding-right:20px;'>数量:" + q + "</span> ");
                        sb.Append(" <img id=p"+ id +" src='images/plus.png'style='height: 25px;padding-right:15px;float:left;'class='img-responsive' onclick='addtocart(this,1)'> ");
                        sb.Append(" <img id=p"+ id +" src='images/remove.png'style='height: 25px;float:left;'class='img-responsive' onclick='deletefromcart(this)'> </div>");
                        sb.Append("<div style='float:right;width:40%'><span id=t" + id + ">总价:￥" + every_price + "</span></div>");
                        sb.Append("<div class='delivery'>\n");
                        sb.Append("<div class='clearfix'></div>\n");
                        sb.Append("</div>\n");
                        sb.Append("</div>\n");
                        sb.Append("<div class='clearfix'></div>\n");
                        sb.Append("</div>\n");
                        sb.Append("</div>\n");
                    }
                }
            }
            if (shopping_count == 0)
            {
                sb.Append("<img  src='images/emptycart.png' class='img-responsive' alt='' style='padding-left:100px'>\n");//购物车是空的
            }
            else
            {
                StringBuilder ButtonBuilder = new StringBuilder();
                ButtonBuilder.Append("<form action='#' method='post' runat='server'>\n");
                ButtonBuilder.Append("<asp:Button ID='Button1' OnClick='Unnamed_Click' runat='server' Text='提交订单'/>\n");
                ButtonBuilder.Append("</form>\n");
                commitOrder = ButtonBuilder.ToString();
            }
            shopping_cart = sb.ToString();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            OrderDAO orderDAO = new OrderDAO();
            OrderEntity order = new OrderEntity();
            DishDAO dishDAO = new DishDAO();

            if ((Request.Cookies["deskId"] != null)&&(Request.Cookies["restaurantId"] != null))
            {
                order.restaurant_id = Convert.ToInt32(Request.Cookies["restaurantId"].Value);
                order.user_id = Convert.ToInt32(Request.Cookies["deskId"].Value);
            }
            else
            {
                order.restaurant_id = 1;//这个要改
                order.user_id = 1;
            }
            order.remark = "空";
            List<HttpCookie> cookieList = new List<HttpCookie>();
            for (int i = 0; i < Request.Cookies.Count; i++)
            {
                string name = Request.Cookies[i].Name;
                if (name.Length >= 13 && Request.Cookies[i].Value != "null" && Request.Cookies[i].Value != "0")
                {
                    string id = name.Substring(13, name.Length - 13);
                    string logo = name.Substring(0, 13);
                    if (logo.Equals("yumiyumi_cart"))
                    {
                        DishEntity temp = dishDAO.getDishById(Convert.ToInt32(id));
                        OrderDetailEntity orderDetail = new OrderDetailEntity();
                        
                        string eachcookie = System.Web.HttpUtility.UrlDecode(Request.Cookies[i].Value.ToString());
                        string[] quantity = eachcookie.Split(';');
                        int q = Convert.ToInt32(quantity[0].Split(':')[1]);
                        orderDetail.count = q;
                        orderDetail.dish_id = temp.id;
                        order.dishList.Add(orderDetail);

                        Request.Cookies[i].Value = "0";
                        HttpCookie cookies = new HttpCookie(name);
                        cookies.Value = "0";
                        cookies.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(cookies);
                    }
                }
            }

                if (orderDAO.addOneOrder(order))
                {
                    Response.Redirect("successOrder.aspx");
                }
        }
    }
}