using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using yumiyumi.Models;

namespace yumiyumi.UI
{
    /// <summary>
    /// CancleService 的摘要说明
    /// </summary>
    public class CancleService : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int service_id = Convert.ToInt32(context.Request.QueryString["service_id"]);
            ServiceDAO serviceDAO = new ServiceDAO();
            bool success = serviceDAO.deleteById(service_id);
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