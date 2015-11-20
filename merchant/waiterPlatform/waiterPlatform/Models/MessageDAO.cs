using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace waiterPlatform.Models
{
    public class MessageDAO
    {
        public bool addOneMessage(MessageEntity message)
        {
            string mysql = "insert into `yumiyumi.yumi_message`(`message_text`,`from_id`,`to_id`,`status`,`message_id`,`ctime`,`restaurant_id`) values(?text,?fromId,?toId,?stauts,?id,?ctime,?restaurantId);";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?text", MySqlDbType.Text),
                    new MySqlParameter("?fromId", MySqlDbType.Int32),
                    new MySqlParameter("?toId", MySqlDbType.Int32),
                    new MySqlParameter("?stauts", MySqlDbType.UInt32),
                    new MySqlParameter("?id", MySqlDbType.Int32),
                    new MySqlParameter("?ctime", MySqlDbType.VarChar,32),
                    new MySqlParameter("?restaurantId", MySqlDbType.Int32)
                    };
            parameters[0].Value = message.message_text;
            parameters[1].Value = message.from_id;
            parameters[2].Value = message.to_id;
            parameters[3].Value = message.status;
            parameters[4].Value = message.message_id;
            parameters[5].Value = System.DateTime.Now.Ticks;
            parameters[6].Value = message.restaurant_id;

            //通过MySqlCommand的ExecuteReader()方法构造DataReader对象
            int count = MySqlHelper.ExecuteNonQuery(mysql, parameters);
            if (count > 0) { return true; }
            else { return false; }
        }

        public List<MessageEntity> getMessageByRestaurantId(int restaurantId)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT `message_text`,`from_id`,`to_id`,`status`,`message_id`,`ctime` FROM `yumiyumi`.`yumi_message` where restaurant_id=?restaurantId ORDER BY `message_id` DESC  LIMIT 0,50;";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?restaurantId", MySqlDbType.Int32),
                    };
            parameters[0].Value = restaurantId;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            List<MessageEntity> list = new List<MessageEntity>();
            while (myreader.Read())
            {
                MessageEntity message = new MessageEntity();
                message.message_text = myreader.GetString(0);
                message.from_id = myreader.GetInt32(1);
                message.to_id = myreader.GetInt32(2);
                message.status = myreader.GetInt32(3);
                message.message_id = myreader.GetInt32(4);
                message.ctime = myreader.GetString(5);
                message.restaurant_id = restaurantId;
                list.Add(message);
            }
            myreader.Close();
            return list;
        }
    }

}