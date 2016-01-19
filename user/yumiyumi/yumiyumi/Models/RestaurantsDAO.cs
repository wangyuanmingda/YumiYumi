using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Web;

namespace yumiyumi.Models
{
    public class RestaurantsDAO
    {
        public List<RestaurantEntity> getAll()
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT * FROM yumiyumi.yumi_brand";
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql);
            List<RestaurantEntity> resturantsList = new List<RestaurantEntity>();
            while (myreader.Read())
            {
                RestaurantEntity resturant = new RestaurantEntity();
                resturant.id = myreader.GetInt32(0);
                resturant.name = myreader.GetString(1);
                resturant.photo = myreader.GetString(2);
                resturant.description = myreader.GetString(3);
                resturant.location = myreader.GetString(4);
                resturantsList.Add(resturant);
            }
            myreader.Close();
            return resturantsList;
        }

        public List<RestaurantEntity> getByName(string name)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT * FROM yumiyumi.yumi_brand where brand_name like ?name";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?name", MySqlDbType.VarChar, 255),
                    };
            parameters[0].Value = "%"+name+"%";
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            List<RestaurantEntity> resturantsList = new List<RestaurantEntity>();
            while (myreader.Read())
            {
                RestaurantEntity resturant = new RestaurantEntity();
                resturant.id = myreader.GetInt32(0);
                resturant.name = myreader.GetString(1);
                resturant.photo = myreader.GetString(2);
                resturant.description = myreader.GetString(3);
                resturant.location = myreader.GetString(4);
                resturantsList.Add(resturant);
            }
            myreader.Close();
            return resturantsList;
        }

        public List<DishEntity> getById(string id)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT * FROM yumiyumi.yumi_dish natural join yumi_brand natural join yumi_brand_type where brand_id = ?id";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?id", MySqlDbType.VarChar, 255),
                    };
            parameters[0].Value = id;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            List<DishEntity> dishList = new List<DishEntity>();
            while (myreader.Read())
            {
                DishEntity dish = new DishEntity();
                dish.id = myreader.GetInt32(2);
                dish.photo = myreader.GetString(3);
                dish.brand_id = myreader.GetInt32(0);
                dish.description = myreader.GetString(4);
                dish.price = myreader.GetInt32(5);
                dish.dish_name = myreader.GetString(6);
                dish.type_id = myreader.GetInt32(1);
                dish.type_name = myreader.GetString(11);
                dishList.Add(dish);
            }
            myreader.Close();
            return dishList;
        }

        public int getTypeCount(string id)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT count(type_id) FROM yumi_brand_type where brand_id=?id";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?id", MySqlDbType.VarChar, 255),
                    };
            parameters[0].Value = id;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            int count = 0;
            while (myreader.Read())
            {
                count = myreader.GetInt32(0);
            }
            myreader.Close();
            return count;
        }
    }
}