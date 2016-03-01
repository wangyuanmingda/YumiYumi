using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    public partial class order_list : System.Web.UI.Page
    {
        public String orderList;
        public int orderId;
        public int total_price;
        public int total_count;

        public int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["orderId"]);
            orderId = id;
            total_price = 0;
            total_count = 0;
            orderList = listDetailOrder(id);
        }

        public String listDetailOrder(int id)
        {
            OrderDAO orderDAO = new OrderDAO();
            DishDAO dishDAO = new DishDAO();
            OrderEntity order = orderDAO.getOneOrderByOrderId(id);
            userId = order.user_id;
            StringBuilder sb = new StringBuilder();

            for (int j = 0; j < order.dishList.Count; j++)
            {
                DishEntity dish = dishDAO.getDishById(order.dishList[j].dish_id);
                total_price += order.dishList[j].count * dish.price;
                total_count += order.dishList[j].count;
                switch (order.dishList[j].status)
                {
                    //对订单状态进行分类，应该需要换，优化
                    case 0:
                        sb.Append("<div class='thumbnail'>");
                        sb.Append("<a class='fb' rel='group' href='img/examples/photo/example_1.jpg'><img src='img/examples/photo/example_1s.jpg' class='img-polaroid'/></a>");
                        sb.Append("<div class='caption'>");
                        sb.Append("<h3>菜名:"+dish.dish_name+"</h3>");
                        sb.Append("<p>数量:" + order.dishList[j].count+ "</p>");
                        sb.Append("<p class='bl_blue'>状态:" + "未完成" + "</p>");
                        sb.Append("<p>单价:" + dish.price + "</p>");
                        sb.Append("<p>备注:</p>");
                        sb.Append("<p><a class='btn btn-warning'  id='" + order.dishList[j].id + "' OnClick='finishDish(this)' href='###'>完成</a> <a class='btn' href='#'>取消</a></p>");
                        sb.Append("</div>");
                        sb.Append("</div>");  
                        break;
                    case 1:
                        sb.Append("<div class='thumbnail'>");
                        sb.Append("<a class='fb' rel='group' href='img/examples/photo/example_1.jpg'><img src='img/examples/photo/example_1s.jpg' class='img-polaroid'/></a>");
                        sb.Append("<div class='caption'>");
                        sb.Append("<h3>菜名:" + dish.dish_name + "</h3>");
                        sb.Append("<p>数量:" + order.dishList[j].count + "</p>");
                        sb.Append("<p class='bl_blue'>状态:" + "完成" + "</p>");
                        sb.Append("<p>单价:" + dish.price + "</p>");
                        sb.Append("<p>备注：</p>");
                        sb.Append("<p><a class='btn btn-warning' href='#'>完成</a> <a class='btn' href='#'>取消</a></p>");
                        sb.Append("</div>");
                        sb.Append("</div>");  
                        break;
                    case 2:
                        sb.Append("<div class='thumbnail'>");
                        sb.Append("<a class='fb' rel='group' href='img/examples/photo/example_1.jpg'><img src='img/examples/photo/example_1s.jpg' class='img-polaroid'/></a>");
                        sb.Append("<div class='caption'>");
                        sb.Append("<h3>菜名" + dish.dish_name + "</h3>");
                        sb.Append("<p>数量" + order.dishList[j].count + "</p>");
                        sb.Append("<p>备注：</p>");
                        sb.Append("<p><a class='btn btn-warning' href='#'>完成</a> <a class='btn' href='#'>取消</a></p>");
                        sb.Append("</div>");
                        sb.Append("</div>");  
                        break;
                }
            }
            
            return sb.ToString();
        }

    }
}