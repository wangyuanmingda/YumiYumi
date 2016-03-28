using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using yumiyumi.Models;

namespace yumiyumi.UI
{
    /// <summary>
    /// AddService 的摘要说明
    /// </summary>
    public class AddService : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
 //           int user_id = Convert.ToInt32(context.Request.QueryString["user_id"]);
            int restaurant_id = Convert.ToInt32(context.Request.QueryString["restaurant_id"]);
            int service_type = Convert.ToInt32(context.Request.QueryString["service_type"]);
            ServiceDAO serviceDAO = new ServiceDAO();
            ServiceEntity service = new ServiceEntity();
   //         service.user_id = user_id;
            service.restaurant_id = restaurant_id;
            service.service_type = service_type;
            service.ctime = System.DateTime.Now.ToString();
            service.status = 0;
            bool success = serviceDAO.addOneService(service);
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