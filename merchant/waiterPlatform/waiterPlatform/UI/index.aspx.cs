using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using waiterPlatform.Models;

namespace waiterPlatform.UI
{
    public partial class index : System.Web.UI.Page
    {
        public String messagePart;
        public String orderPart;
        public String servicePart;
        protected void Page_Load(object sender, EventArgs e)
        {
            getAllMessages();
            getAllOrders();
            getServiceCall();
        }

        public void getServiceCall()
        {
            StringBuilder sb = new StringBuilder();
            ServiceDAO serviceDAO = new ServiceDAO();
            List<ServiceEntity> list = serviceDAO.getAllServiceByRestaurantId(1);
            for (int i = 0; i < list.Count; i++)
            {
                DateTime todaydate = Convert.ToDateTime(list[i].ctime);
                String date = todaydate.ToString("hh:mm:ss");

                sb.Append("<tr>");
                sb.Append("<td><input type='checkbox' name='checkbox'/></td>");
                sb.Append("<td>"+list[i].user_id+"</td>");
                sb.Append("<td>"+list[i].service_name+"</td>");
                sb.Append("<td>"+date+"</td>");
                sb.Append("<td>");
                sb.Append("<a href='#' class='button green'>");
                sb.Append("<div class='icon'><span class='ico-pencil'></span></div>");
                sb.Append("</a>");
                sb.Append("<a href='#' class='button red'>");
                sb.Append("<div class='icon'><span class='ico-remove'></span></div>");
                sb.Append("</a>");
                sb.Append("</td>");
                sb.Append("</tr>");
            }
            servicePart = sb.ToString();

        }

        public void getAllMessages()
        {
            MessageDAO messageDAO = new MessageDAO();
            List<MessageEntity> messageList = messageDAO.getMessageByRestaurantId(1);
            StringBuilder sb = new StringBuilder();
            for (int i = messageList.Count-1; i >= 0; i--)
            {
                MessageEntity message = messageList[i];

                DateTime todaydate = Convert.ToDateTime(message.ctime);
                String date = todaydate.ToString("hh:mm:ss");
                if (message.to_id != -1)
                {
                    sb.Append("<div class='item dblue out'>");
                    sb.Append("<div class='arrow'></div>");
                    sb.Append("<div class='text'>" + message.message_text + "</div>");
                    sb.Append("<div class='date'>" + date + "</div>");
                    sb.Append("</div> ");
                }
                else
                {
                    sb.Append("<div class='item blue'>");
                    sb.Append("<div class='arrow'></div>");
                    sb.Append("<div class='text'>" + message.message_text + "</div>");
                    sb.Append("<div class='date'>" + date + "</div>");
                    sb.Append("</div>");
                }
            
            }
            messagePart = sb.ToString();
        }

        public void getAllOrders()
        {
            OrderDAO orderDAO = new OrderDAO();
            DishDAO dishDAO = new DishDAO();
            List<OrderEntity> list = orderDAO.getAllOrderByRestaurantId(1);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < list.Count;i++ )
            {
                OrderEntity order = list[i];
                String dishString = "";
                for (int j = 0; j < order.dishList.Count-1; j++)
                {
                    DishEntity dish = dishDAO.getDishById(order.dishList[j].dish_id);
                    dishString += dish.dish_name + ",";
                }
                DishEntity dish2 = dishDAO.getDishById(order.dishList[order.dishList.Count-1].dish_id);
                dishString += dish2.dish_name;
                DateTime todaydate = Convert.ToDateTime(order.start_time);
                String date = todaydate.ToString("MM/dd hh:mm:ss");
                    switch (order.status)
                    {
                        case 0:
                            sb.Append("<tr>");
                            sb.Append("<td width='55' class='bl_blue'><span class='label label-info'>新订单</span></td>");
                            sb.Append("<td width='50'>#AA-325 <span class='mark'>"+date+"</span></td>");
                            sb.Append("<td><a href='../ftpm_7/menu_list.aspx' class='cblue'>"+dishString+"</a>");
                            sb.Append("<span class='mark'>来自"+order.user_id+"号桌</span></td>");
                            sb.Append("</tr>");
                            break;
                        case 1:
                            sb.Append("<tr>");
                            sb.Append("<td class='bl_green'><span class='label label-success'>完成</span></td>");
                            sb.Append("<td width='50'>#AA-325 <span class='mark'>" + date + "</span></td>");
                            sb.Append("<td><a href='#' class='cgreen'>" + dishString + "</a>");
                            sb.Append("<span class='mark'>来自" + order.user_id + "号桌</span></td>");
                            sb.Append("</tr>");
                            break;
                        case 2:
                            sb.Append("<tr>");
                            sb.Append("<td class='bl_red'><span class='label label-important'>取消</span></td>");
                            sb.Append("<td>#VB-57 <span class='mark'>" + date + "</span></td>");
                            sb.Append("<td><a href='#' class='cred'>" + dishString + "</a>");
                            sb.Append("<span class='mark'>来自" + order.user_id + "号桌</span></td>");
                            sb.Append("</tr>");
                            break;
                    }
            }
            orderPart = sb.ToString();
        }

    }
}