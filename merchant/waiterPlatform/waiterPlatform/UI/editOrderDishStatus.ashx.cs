using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using waiterPlatform.Models;

namespace waiterPlatform.UI
{
    /// <summary>
    /// editOrderDishStatus 的摘要说明
    /// </summary>
    public class editOrderDishStatus : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int detailDish = Convert.ToInt32(context.Request.QueryString["id"]);
            OrderDAO orderDAO = new OrderDAO();
            bool success = orderDAO.finishDetailOrderDish(detailDish);
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