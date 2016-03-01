using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    /// <summary>
    /// deleteService 的摘要说明
    /// </summary>
    public class deleteService : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int serviceId = Convert.ToInt32(context.Request.QueryString["serviceId"]);
            ServiceDAO serviceDAO = new ServiceDAO();
            bool success = serviceDAO.deleteById(serviceId);
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