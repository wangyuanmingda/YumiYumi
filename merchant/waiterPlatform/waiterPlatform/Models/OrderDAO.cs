using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace waiterPlatform.Models
{
    public class OrderDAO
    {
        public bool addOneOrder(OrderEntity order)
        {
            string mysql = "insert `yumi_order`(`order_id`,`user_id`,`restaurant_id`,`remark`,`total_price`) values(?orderId,userId,restaurantId,?remark,?total);";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?userId", MySqlDbType.UInt32),
                    new MySqlParameter("?restaurantId", MySqlDbType.UInt32),
                    new MySqlParameter("?remark", MySqlDbType.VarChar,255),
                    new MySqlParameter("?total", MySqlDbType.UInt32)
                    };
            parameters[1].Value = order.user_id;
            parameters[2].Value = order.restaurant_id;
            parameters[3].Value = order.remark;
            parameters[4].Value = order.total_price;

            //通过MySqlCommand的ExecuteReader()方法构造DataReader对象
            int count = MySqlHelper.ExecuteNonQuery(mysql, parameters);
            if (count > 0) { return true; }
            else { return false; }
        }

        public void addOneOrderDishes(OrderEntity order,int orderId)
        {
            for(int i=0;i<order.dishList.Count;i++){
                string mysql = "insert `yumi_order_detail`(`order_id`,`dish_id`,`dish_count`) values(?orderId,?dishId,?dishCount);";
                MySqlParameter[] parameters = {
                        new MySqlParameter("?orderId", MySqlDbType.UInt32),
                        new MySqlParameter("?dishId", MySqlDbType.UInt32),
                        new MySqlParameter("?dishCount", MySqlDbType.UInt32)
                        };
                parameters[0].Value = orderId;
                parameters[1].Value = order.dishList[i].id;
                parameters[2].Value = order.dishList[i].count;
                //通过MySqlCommand的ExecuteReader()方法构造DataReader对象
                int count = MySqlHelper.ExecuteNonQuery(mysql, parameters);
            }
        }

        public List<OrderEntity> getAllOrderByRestaurantId(int restaurantId)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT `order_id`,`user_id`,`restaurant_id`,`remark`,`total_price` FROM `yumi_order` WHERE `restaurant_id` =?restaurantId";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?restaurantId", MySqlDbType.UInt32)
                    };
            parameters[0].Value = restaurantId;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            List<OrderEntity> list = new List<OrderEntity>();
            while (myreader.Read())
            {
                OrderEntity order = new OrderEntity();
                order.order_id = myreader.GetInt32(0);
                order.user_id = myreader.GetInt32(1);
                order.restaurant_id = myreader.GetInt32(2);
                order.remark = myreader.GetString(3);
                order.total_price = myreader.GetInt32(4);
                string mysql2 = "SELECT `id`,`order_id`,`dish_id`,`dish_count` FROM `yumi_order_detail` WHERE `order_id` =?orderId;";
                MySqlParameter[] parameters2 = {
                    new MySqlParameter("?orderId", MySqlDbType.UInt32)
                    };
                parameters2[0].Value = order.order_id;
                MySqlDataReader myreader2 = MySqlHelper.ExecuteReader(mysql2, parameters2);
                while (myreader2.Read())
                {
                    OrderDetailEntity detail = new OrderDetailEntity();
                    detail.order_id = myreader.GetInt32(1);
                    detail.dish_id = myreader.GetInt32(2);
                    detail.count = detail.dish_id = myreader.GetInt32(3);
                    order.dishList.Add(detail);
                }
                list.Add(order);
            }
            myreader.Close();
            return list;
        }

        public OrderEntity getOneOrderByOrderId(int orderId)
        {
            string mysql = "SELECT `order_id`,`user_id`,`restaurant_id`,`remark`,`total_price` FROM `yumi_order` WHERE `order_id` =?orderId";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?orderId", MySqlDbType.UInt32)
                    };
            parameters[0].Value = orderId;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            OrderEntity order = new OrderEntity();
            while (myreader.Read())
            {
                order.order_id = myreader.GetInt32(0);
                order.user_id = myreader.GetInt32(1);
                order.restaurant_id = myreader.GetInt32(2);
                order.remark = myreader.GetString(3);
                order.total_price = myreader.GetInt32(4);
                string mysql2 = "SELECT `id`,`order_id`,`dish_id`,`dish_count` FROM `yumi_order_detail` WHERE `order_id` =?orderId;";
                MySqlParameter[] parameters2 = {
                    new MySqlParameter("?orderId", MySqlDbType.UInt32)
                    };
                parameters2[0].Value = order.order_id;
                MySqlDataReader myreader2 = MySqlHelper.ExecuteReader(mysql2, parameters2);
                while (myreader2.Read())
                {
                    OrderDetailEntity detail = new OrderDetailEntity();
                    detail.order_id = myreader.GetInt32(1);
                    detail.dish_id = myreader.GetInt32(2);
                    detail.count = detail.dish_id = myreader.GetInt32(3);
                    order.dishList.Add(detail);
                }
            }
            return order;
        }


        public void addOneOrderDishes(OrderEntity order, int orderId)
        {
            for (int i = 0; i < order.dishList.Count; i++)
            {
                string mysql = "insert `yumi_order_detail`(`order_id`,`dish_id`,`dish_count`) values(?orderId,?dishId,?dishCount);";
                MySqlParameter[] parameters = {
                        new MySqlParameter("?orderId", MySqlDbType.UInt32),
                        new MySqlParameter("?dishId", MySqlDbType.UInt32),
                        new MySqlParameter("?dishCount", MySqlDbType.UInt32)
                        };
                parameters[0].Value = orderId;
                parameters[1].Value = order.dishList[i].id;
                parameters[2].Value = order.dishList[i].count;
                //通过MySqlCommand的ExecuteReader()方法构造DataReader对象
                int count = MySqlHelper.ExecuteNonQuery(mysql, parameters);
            }
        }

    }
}