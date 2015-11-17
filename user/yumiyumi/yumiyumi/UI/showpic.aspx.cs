using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using yumiyumi.Models;

namespace Cinema
{
    public partial class showpic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RestaurantsDAO restuarantDAO = new RestaurantsDAO();

                this.Response.Clear();
                //输出mime类型,根据上传的文件取到的mimetype
                this.Response.ContentType = "";
  //              this.Response.BinaryWrite();
                this.Response.End();

        }
    }
}