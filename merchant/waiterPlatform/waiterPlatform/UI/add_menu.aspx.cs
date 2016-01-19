using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using waiterPlatform.Models;

namespace waiterPlatform.UI
{
    public partial class add_menu : System.Web.UI.Page
    {
        public String dd;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        public void addDish()
        {
            string DishName = Request.Form["name"];
            int DishPrice = Convert.ToInt32(Request.Form["price"]);
            string DishDescription = Request.Form["description"];
            int Spicy = Convert.ToInt32(Request.Form["spicy"]);
            string photo;

            DishDAO dishDAO = new DishDAO();
            DishEntity dish = new DishEntity();
            dish.dish_name = DishName;
            dish.price = DishPrice;
            dish.description = DishDescription;

            if (dishDAO.addOneDish(dish))
            {
                Response.Write("<Script Language='JavaScript'>alert('添加成功');</Script>");
                Response.Redirect("menu_list.aspx");
            }
            else
            {
                Response.Write("<Script Language='JavaScript'>alert('添加错误,亲!');</Script>");
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            addDish();
        }
    }
}