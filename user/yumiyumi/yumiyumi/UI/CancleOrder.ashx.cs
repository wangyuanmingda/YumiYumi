using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using yumiyumi.Models;

namespace yumiyumi.UI
{
    /// <summary>
    /// CancleOrder 的摘要说明
    /// </summary>
    public class CancleOrder : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int order_id = Convert.ToInt32(context.Request.QueryString["order_id"]);
            OrderDAO orderDAO = new OrderDAO();
            bool success = orderDAO.deleteById(order_id);
            context.Response.Write(success + "\n");
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