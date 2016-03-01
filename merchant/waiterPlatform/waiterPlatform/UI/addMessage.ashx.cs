using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    /// <summary>
    /// addMessage 的摘要说明
    /// </summary>
    public class addMessage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            String content = context.Request.QueryString["content"];
            MessageDAO messageDAO = new MessageDAO();
            MessageEntity message = new MessageEntity();
            message.ctime = System.DateTime.Now.ToString();
            message.from_id = -1;
            message.to_id = 1;
            message.status = 0;
            message.message_text = content;
            message.restaurant_id = 1;
            messageDAO.addOneMessage(message);
            context.Response.Write(content);
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