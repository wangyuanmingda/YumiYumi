using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    public partial class edit_dish : System.Web.UI.Page
    {
        public String dd;
        public String name;
        public int price;
        public String description;
        protected void Page_Load(object sender, EventArgs e)
        {
            int dish_id = Convert.ToInt32(Request.QueryString["dish_id"]);
            DishDAO dishDAO = new DishDAO();
            DishEntity dish = new DishEntity();
            dish = dishDAO.getDishById(dish_id);
            name = dish.dish_name;
            price = dish.price;
            description = dish.description;
        }

        public void addDish()
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string DishName = Request.Form["name"];
            int DishPrice = Convert.ToInt32(Request.Form["price"]);
            string DishDescription = Request.Form["description"];
            int Spicy = Convert.ToInt32(Request.Form["spicy"]);

            DishDAO dishDAO = new DishDAO();
            DishEntity dish = new DishEntity();
            dish.dish_name = DishName;
            dish.price = DishPrice;
            dish.description = DishDescription;

            if (dishDAO.addOneDish(dish))
            {
                Response.Write("<Script Language='JavaScript'>alert('添加成功');</Script>");
            }
            else
            {
                Response.Write("<Script Language='JavaScript'>alert('添加错误,亲!');</Script>");
            }
        }
    }
}