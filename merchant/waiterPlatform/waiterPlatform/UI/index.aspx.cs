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
    public partial class index : System.Web.UI.Page
    {
        public String messagePart;
        public String orderPart;
        public String servicePart;
        public int restaurantId;
        protected void Page_Load(object sender, EventArgs e)
        {
            identify();
            getAllMessages();
            getAllOrders();
            getServiceCall();
            //getPath();
        }

        int[,] A;
        public string number;
        public string js;
        const int MAXINT = 32767;
        public void getPath()
        {
            MapDAO mm = new MapDAO();
            MapEntity entity = mm.getMap();
            Dijkstra dijkstra = new Dijkstra();
            int[] pre = dijkstra.run(38, entity.dist, 41);
            StringBuilder sb = new StringBuilder();

            int endpoint = 5;
            int ss = pre[endpoint];
            sb.Append("context.moveTo(" + entity.vertexList[endpoint - 1].x + ", " + entity.vertexList[endpoint - 1].y + ");"); // 设置路径起点，坐标为(20,20)
            sb.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
            number = "1<-" + ss + "<-";
            while (ss != 38)
            {
                ss = pre[ss];
                sb.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                number += ss + "<-";
            }
            js = sb.ToString();
        }

        public void identify()
        {
            if (Request.Cookies["restaurantId"] != null)
            {
                restaurantId = Convert.ToInt32(Request.Cookies["restaurantId"].Value);
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        public void getServiceCall()
        {
            StringBuilder sb = new StringBuilder();
            ServiceDAO serviceDAO = new ServiceDAO();
            List<ServiceEntity> list = serviceDAO.getAllServiceByRestaurantId(restaurantId);
            for (int i = 0; i < list.Count; i++)
            {
                DateTime todaydate = Convert.ToDateTime(list[i].ctime);
                String date = todaydate.ToString("hh:mm:ss");
                switch (list[i].status)
                {
                    //对订单状态进行分类，应该需要换，优化
                    case 0:
                        sb.Append("<tr>");
                        sb.Append("<td><input type='checkbox' name='checkbox'/></td>");
                        sb.Append("<td>"+list[i].user_id+"</td>");
                        sb.Append("<td>"+list[i].service_name+"</td>");
                        sb.Append("<td>"+date+"</td>");
                        sb.Append("<td width='55' class='bl_blue'><span class='label label-info'>新呼叫</span></td>");
                        sb.Append("<td>");
                        sb.Append("<input id='" + list[i].user_id + "'  type='button' value='绘制路线' onclick='strokeRect(this);'/> ");
                

                        sb.Append("<a href='#' class='button green'>");
                        sb.Append("<div class='icon'><span class='ico-pencil'></span></div>");
                        sb.Append("</a>");
                        sb.Append("<a href='#' class='button red'>");
                        sb.Append("<div class='icon'><span id='" + list[i].id + "' class='ico-remove' OnClick='deleteDish(this)'></span></div>");
                        sb.Append("</a>");
                        sb.Append("</td>");
                        sb.Append("</tr>");
                        break;
                    case 1:
                        sb.Append("<tr>");
                        sb.Append("<td><input type='checkbox' name='checkbox'/></td>");
                        sb.Append("<td>"+list[i].user_id+"</td>");
                        sb.Append("<td>"+list[i].service_name+"</td>");
                        sb.Append("<td>"+date+"</td>");
                        sb.Append("<td class='bl_green'><span class='label label-success'>完成</span></td>");
                        sb.Append("<td>");
                        sb.Append("<input id='" + list[i].user_id + "' type='button' value='绘制路线' onclick='strokeRect(this);'/> ");
                

                        sb.Append("<a href='#' class='button green'>");
                        sb.Append("<div class='icon'><span class='ico-pencil'></span></div>");
                        sb.Append("</a>");
                        sb.Append("<a href='#' class='button red'>");
                        sb.Append("<div><input id='" + list[i].id + "' type='button' value='完成'  OnClick='deleteDish(this)'></div>");
                        sb.Append("</a>");
                        sb.Append("</td>");
                        sb.Append("</tr>");
                        break;
                }
            }
            servicePart = sb.ToString();
        }

        public void getAllMessages()
        {
            MessageDAO messageDAO = new MessageDAO();
            //这里到时候要改为根据餐厅id来
            List<MessageEntity> messageList = messageDAO.getMessageByRestaurantId(1);
            StringBuilder sb = new StringBuilder();
            for (int i = messageList.Count-1; i >= 0; i--)
            {
                MessageEntity message = messageList[i];

                DateTime todaydate = new DateTime(Convert.ToInt64(message.ctime));
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
                        //对订单状态进行分类，应该需要换，优化
                        case 0:
                            sb.Append("<tr>");
                            sb.Append("<td width='55' class='bl_blue'><span class='label label-info'>新订单</span></td>");
                            sb.Append("<td width='50'>#AA-325 <span class='mark'>"+date+"</span></td>");
                            //跳转位置
                            sb.Append("<td><a href='order_list.aspx?orderId="+order.order_id+"' class='cblue'>"+dishString+"</a>");
                            sb.Append("<span class='mark'>来自"+order.user_id+"号桌</span></td>");
                            sb.Append("</tr>");
                            break;
                        case 1:
                            sb.Append("<tr>");
                            sb.Append("<td class='bl_green'><span class='label label-success'>完成</span></td>");
                            sb.Append("<td width='50'>#AA-"+order.order_id+" <span class='mark'>" + date + "</span></td>");
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