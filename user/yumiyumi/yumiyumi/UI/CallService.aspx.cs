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
    public partial class callService : System.Web.UI.Page
    {
        public string servicePart;
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
            getServiceCall();
        }

        public void getServiceCall()
        {
            StringBuilder sb = new StringBuilder();
            ServiceDAO serviceDAO = new ServiceDAO();
            List<ServiceEntity> list = serviceDAO.getServiceByUserId(user_id);
            for (int i = 0; i < list.Count; i++)
            {
                DateTime todaydate = Convert.ToDateTime(list[i].ctime);
                String date = todaydate.ToString("hh:mm:ss");

                sb.Append("<tr>");
                sb.Append("<td><input type='checkbox' name='checkbox'/></td>");
                sb.Append("<td>" + list[i].user_id + "</td>");
                sb.Append("<td>" + list[i].service_name + "</td>");
                sb.Append("<td>" + date + "</td>");
                sb.Append("<td>等待中</td>");
                sb.Append("<td>取消服务</td>");
                sb.Append("<a href='#' class='button green'>");
                sb.Append("<div class='icon'><span class='ico-pencil'></span></div>");
                sb.Append("</a>");
                sb.Append("<a href='#' class='button red'>");
                sb.Append("<div class='icon'><span id='" + list[i].id + "' class='ico-remove' OnClick='deleteDish(this)'></span></div>");
                sb.Append("</a>");
                sb.Append("</td>");
                sb.Append("</tr>");
            }
            servicePart = sb.ToString();

        }
    }
}