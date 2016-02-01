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
    public partial class MyOrder : System.Web.UI.Page
    {
        public string orderPart;
        private int restaurant_id;
        private int user_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            //获得餐厅id以及座位id
            if ((Request.Cookies["deskId"] != null) && (Request.Cookies["restaurantId"] != null))
            {
                restaurant_id = Convert.ToInt32(Request.Cookies["restaurantId"].Value);
                user_id = Convert.ToInt32(Request.Cookies["deskId"].Value);
            }
            else
            {
                restaurant_id = 1;//这个要改
                user_id = 1;
            }
            getAllOrders();
        }

        public void getAllOrders()
        {
            OrderDAO orderDAO = new OrderDAO();
            DishDAO dishDAO = new DishDAO();
            List<OrderEntity> list = orderDAO.getOrderByUserId(user_id);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < list.Count; i++)
            {
                OrderEntity order = list[i];
                String dishString = "";
                for (int j = 0; j < order.dishList.Count - 1; j++)
                {
                    DishEntity dish = dishDAO.getDishById(order.dishList[j].dish_id);
                    dishString += dish.dish_name + ",";
                }
                DishEntity dish2 = dishDAO.getDishById(order.dishList[order.dishList.Count - 1].dish_id);
                dishString += dish2.dish_name;
                DateTime todaydate = Convert.ToDateTime(order.start_time);
                String date = todaydate.ToString("MM/dd hh:mm:ss");
                switch (order.status)
                {
                    //对订单状态进行分类，应该需要换，优化
                    case 0:
                        sb.Append("<tr>");
                        sb.Append("<td width='55' class='bl_blue'><span class='label label-info'>新订单</span></td>");
                        sb.Append("<td>" + order.user_id + "</td>");
                        //跳转位置
                        sb.Append("<td><a href='order_list.aspx?orderId=" + order.order_id + "' class='cblue'>" + dishString + "</a>");
                        sb.Append("<td><span class='mark'>" + date + "</span></td>");
                        sb.Append("<td>已接单，正在制作中</td>");
                        sb.Append("</tr>");
                        break;
                    case 1:
                        sb.Append("<tr>");
                        sb.Append("<td class='bl_green'><span class='label label-success'>完成</span></td>");
                        sb.Append("<td width='50'>#AA-" + order.order_id + " <span class='mark'>" + date + "</span></td>");
                        sb.Append("<td><a href='order_list.aspx?orderId=" + order.order_id + "' class='cgreen'>" + dishString + "</a>");
                        sb.Append("<span class='mark'>来自" + order.user_id + "号桌</span></td>");
                        sb.Append("</tr>");
                        break;
                    case 2:
                        sb.Append("<tr>");
                        sb.Append("<td class='bl_red'><span class='label label-important'>取消</span></td>");
                        sb.Append("<td>#VB-57 <span class='mark'>" + date + "</span></td>");
                        sb.Append("<td><a href='order_list.aspx?orderId=" + order.order_id + "' class='cred'>" + dishString + "</a>");
                        sb.Append("<span class='mark'>来自" + order.user_id + "号桌</span></td>");
                        sb.Append("</tr>");
                        break;
                }
            }
            orderPart = sb.ToString();
        }
    }
}