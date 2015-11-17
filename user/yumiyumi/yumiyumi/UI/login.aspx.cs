using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yumiyumi.Models;

namespace yumiyumi.UI
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)//判断页面是否为第一次加载
            {
                string uEmail = Request.Form["txtEmail"];
                string uPwd = Request.Form["txtPwd"];
                AccountDAO account = new AccountDAO();
                AccountEntity entity = account.login(uEmail, uPwd);
                if (entity.user_name == uEmail)
                {
                    HttpCookie cook = new HttpCookie("uId", entity.user_id.ToString());//新建一个cookie对象
                    cook.Expires = DateTime.Now.AddMinutes(30);//保存cookie期限为30分钟
                    HttpCookie cookTime = new HttpCookie("cookt", DateTime.Now.AddDays(2).ToString());
                    Response.Cookies.Add(cook);
                    Response.Cookies.Add(cookTime);
                    Response.Redirect("index.aspx");//重定向 302，通过登录验证，跳转到Default.aspx页面，也就是所谓的登录后的页面
                }
                else
                {
                    Response.Write("<Script Language='JavaScript'>alert('" + entity.user_id + "密码错误,亲!');</Script>");
                }
            }
        }
    }
}