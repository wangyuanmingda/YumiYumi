using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace yumiyumiDB
{
    public class AccountDAO
    {/*
        public AccountEntity connect()
        {
            //string myStr = ConfigurationManager.AppSettings["MySqlServer"].ToString();
            string mysql = "SELECT * FROM yumiyumi.yumi_account";
            MySqlConnection conn = new MySqlConnection(myStr);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand(mysql, conn);
            MySqlCommand mycommand = new MySqlCommand(mysql, conn);
            //通过MySqlCommand的ExecuteReader()方法构造DataReader对象
            MySqlDataReader myreader = mycommand.ExecuteReader();
            AccountEntity user = new AccountEntity();
            while (myreader.Read())
            {
                user.user_id = myreader.GetInt32(0);
                user.user_name = myreader.GetString(1);
                user.password = myreader.GetString(2);
            }
            myreader.Close();

            conn.Close();
            return user;
        }

        public AccountEntity addUser()
        {
            //string myStr = ConfigurationManager.AppSettings["entityFramework"].ToString();
            string mysql = "SELECT * FROM yumiyumi.yumi_account";
            MySqlConnection conn = new MySqlConnection(myStr);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand(mysql, conn);
            MySqlCommand mycommand = new MySqlCommand(mysql, conn);
            //通过MySqlCommand的ExecuteReader()方法构造DataReader对象
            MySqlDataReader myreader = mycommand.ExecuteReader();
            AccountEntity user = new AccountEntity();
            while (myreader.Read())
            {
                user.user_id = myreader.GetInt32(0);
                user.user_name = myreader.GetString(1);
                user.password = myreader.GetString(2);
            }
            myreader.Close();

            conn.Close();
            return user;
        }
        */
        public AccountEntity login(string email,string password)
        {
            //string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name ='"+email+"'";
            string mysql = "SELECT * FROM yumiyumi.yumi_account where user_name = ?user_name";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?user_name", MySqlDbType.VarChar, 255),
                    };
            parameters[0].Value = email;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            AccountEntity user = new AccountEntity();
            while (myreader.Read())
            {
                user.user_id = myreader.GetInt32(0);
                user.user_name = myreader.GetString(1);
                user.password = myreader.GetString(2);
            }
            myreader.Close();
            return user;
        }
    }
}