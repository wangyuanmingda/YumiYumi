using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    /// <summary>
    /// finishOrder 的摘要说明
    /// </summary>
    public class finishOrder : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int orderId = Convert.ToInt32(context.Request.QueryString["orderId"]);
            OrderDAO orderDAO = new OrderDAO();
            bool success = orderDAO.finishOrder(orderId);
            context.Response.Write(success + "\n");
            context.Response.Write("help");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}