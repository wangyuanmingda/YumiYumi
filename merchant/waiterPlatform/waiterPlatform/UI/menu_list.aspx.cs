using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    public partial class menu_list : System.Web.UI.Page
    {
        public String dishList;
        protected void Page_Load(object sender, EventArgs e)
        {
          //  identify();
            loadDishesList();
        }

        public void identify()
        {
            if (Request.Cookies["restaurantId"] != null)
            {
                string username = Request.Cookies["restaurantId"].Value;
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        private void loadDishesList()
        {
            StringBuilder sb = new StringBuilder();
            string id = Request.Cookies["restaurantId"].Value;
            if (id == null)
            {
                return;
            }
            DishDAO dishDao = new DishDAO();
            List<DishEntity> list = dishDao.getByResaurantId(Convert.ToInt32(id));
            if (list.Count > 0) { 
                for(int i=0;i<list.Count;i++){
                    sb.Append("<tr>");
                    sb.Append("<td><input type='checkbox' name='order[]' value='528'/></td>");
                    sb.Append("<td><a href='edit_dish.aspx?dish_id="+list[i].id+"'>" + list[i].dish_name + "</a></td>");
                    sb.Append("<td>Product #"+list[i].id+"</td>");
                    sb.Append("<td><span>"+list[i].price+"</span></td>");
                    sb.Append("<td>" + list[i].price + "</td>");
                    sb.Append("<td>"+list[i].dish_name+"</td>");
                    sb.Append("<td>");
                    sb.Append("<a href='#' class='button green'>");
                    sb.Append("<div class='icon'><span id='" + list[i].id + "' class='ico-pencil' OnClick='editDish(this)'></span></div>");
                    sb.Append("<a href='#' class='button red'>");
                    sb.Append("<div class='icon'><span id='" + list[i].id + "' class='ico-remove' OnClick='deleteDish(this)'></span></div>");
                    sb.Append("</a>");
                    sb.Append("</td>");
                    sb.Append("</tr>\n");
                }
            }
            dishList = sb.ToString(); 
        }

        public bool deleteDish()
        {
            string dishId = Request.Form["dishId"];
            if (dishId != null)
            {
                DishDAO dishDAO = new DishDAO();
                if (dishDAO.deleteById(Convert.ToInt32(dishId))) { return true; }
                else { return false; }
            }
            return false;
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Write("<Script Language='JavaScript'>alert('"+e.ToString()+"');</Script>"); 
            string dishId = Request.Form["dishId"];

            if (dishId != null)
            {
                DishDAO dishDAO = new DishDAO();
                if (dishDAO.deleteById(Convert.ToInt32(dishId))) { Response.Write("<Script Language='JavaScript'>alert('添加成功');</Script>"); }
                else { Response.Write("<Script Language='JavaScript'>alert('添加错误,亲!');</Script>"); }
            }
        }
    }
}