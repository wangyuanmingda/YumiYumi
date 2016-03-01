using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    /// <summary>
    /// deleteDish 的摘要说明
    /// </summary>
    public class deleteDish : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int dish_id = Convert.ToInt32(context.Request.QueryString["dish_id"]);
            DishDAO dishDAO = new DishDAO();
            bool success = dishDAO.deleteById(dish_id);
            context.Response.Write(success+"\n");
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