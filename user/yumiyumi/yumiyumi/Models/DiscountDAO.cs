using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace yumiyumi.Models
{
    public class DiscountDAO
    {
        public DiscountEntity getDiscountById(int dishId)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT * FROM yumiyumi.yumi_discount where dish_id = ?dish_id ";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?dish_id", MySqlDbType.UInt32),
                    };
            parameters[0].Value = dishId;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            DiscountEntity discount = new DiscountEntity();
            while (myreader.Read())
            {
                discount.branch_id = myreader.GetInt32(0);
                discount.dish_id = dishId;
                discount.reason = myreader.GetString(2);
             /*   if(myreader.GetString(3) != null || myreader.GetString(4) != null){
                    discount.starttime = myreader.GetString(3);
                    discount.endtime = myreader.GetString(4);
                }*/
                
                discount.currentprice = myreader.GetInt32(5);
                
            }
            myreader.Close();
            return discount;
        }

        
    }
}