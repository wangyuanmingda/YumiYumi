using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace waiterPlatform.Models
{
    public class DishDAO
    {

        public bool addOneDish(DishEntity dish)
        {
            string mysql = "INSERT INTO `yumi_dish`( `dish_thumbimage` , `brand_id` , `dish_description` ,"
                + "`dish_price` , `type_id` , `dish_name`,`status` ) values(?dish_thumbimage,"
                + "?brand_id,?dish_description,?dish_price,?type_id,?dish_name,?status)";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?dish_thumbimage", MySqlDbType.VarChar,255),
                    new MySqlParameter("?brand_id", MySqlDbType.UInt32),
                    new MySqlParameter("?dish_description", MySqlDbType.VarChar,255),
                    new MySqlParameter("?dish_price", MySqlDbType.UInt32),
                    new MySqlParameter("?type_id", MySqlDbType.UInt32),
                    new MySqlParameter("?dish_name", MySqlDbType.VarChar,255),
                    new MySqlParameter("?status", MySqlDbType.UInt32)
                    };
            parameters[0].Value = "";
            parameters[1].Value = 1;
            parameters[2].Value = dish.description;
            parameters[3].Value = dish.price;
            parameters[4].Value = dish.type_id;
            parameters[5].Value = dish.dish_name;
            parameters[6].Value = dish.status;

            //通过MySqlCommand的ExecuteReader()方法构造DataReader对象
            int count = MySqlHelper.ExecuteNonQuery(mysql, parameters);
            if (count > 0) { return true; }
            else{return false;}
        }

        public bool deleteById(int dish_id)
        {
            string mysql = "Delete FROM yumiyumi.yumi_dish where dish_id = ?dish_id";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?dish_Id", MySqlDbType.UInt32),
                    };
            parameters[0].Value = dish_id;
            int count = MySqlHelper.ExecuteNonQuery(mysql,parameters);
            if (count > 0){ return true;}
            else { return false; }
        }

        public DishEntity getDishById(int dishId)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT dish_id,dish_thumbimage,brand_id,dish_description,dish_price,type_id,dish_name FROM yumiyumi.yumi_dish where dish_id = ?dish_id";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?dish_id", MySqlDbType.UInt32),
                    };
            parameters[0].Value = dishId;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            DishEntity dish = new DishEntity();
            while (myreader.Read())
            {
                dish.id = dishId;
                dish.photo = myreader.GetString(1);
                dish.brand_id = myreader.GetInt32(2);
                dish.description = myreader.GetString(3);
                dish.price = myreader.GetInt32(4);
                dish.type_id = myreader.GetInt32(5);
                dish.dish_name = myreader.GetString(6);
            }
            myreader.Close();
            return dish;
        }

        public List<DishEntity> getByResaurantId(int brandId)
        {
            string mysql = "SELECT * FROM yumiyumi.yumi_dish where brand_id = ?brand_id";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?brand_id", MySqlDbType.UInt32),
                    };
            parameters[0].Value = brandId;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            List<DishEntity> list = new List<DishEntity>();
            while (myreader.Read())
            {
                DishEntity dish = new DishEntity();
                dish.id = myreader.GetInt32(0);
                dish.photo = myreader.GetString(1);
                dish.brand_id = brandId;
                dish.description = myreader.IsDBNull(3) ? "" : myreader.GetString(3);
                dish.price = myreader.IsDBNull(4) ? 0 : myreader.GetInt32(4);
                dish.type_id = myreader.GetInt32(5);
                dish.dish_name = myreader.IsDBNull(6) ? "" : myreader.GetString(6);
                list.Add(dish);
            }
            myreader.Close();
            return list;
        }
    }
}
