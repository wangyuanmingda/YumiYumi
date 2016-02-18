using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Web;

namespace waiterPlatform.Models
{
    public class MapDAO
    {
        public MapEntity getMap(){
            string mysql = "SELECT * FROM yumiyumi.yumi_map where restaurant_id = ?restaurant_id ORDER BY `number`";
            MySqlParameter[] parameters = {
                    new MySqlParameter("?restaurant_id", MySqlDbType.UInt32),
                    };
            parameters[0].Value = 1;
            MySqlDataReader myreader = MySqlHelper.ExecuteReader(mysql, parameters);
            MapEntity map = new MapEntity(42);
            while (myreader.Read())
            {
                map.addVertex(myreader.GetInt32(3), myreader.GetInt32(4));
            }
            myreader.Close();

            string mysql2 = "SELECT * FROM yumiyumi.yumi_mapdistance where `map_id`  =?map_id";
            MySqlParameter[] parameters2 = {
                    new MySqlParameter("?map_id", MySqlDbType.UInt32),
                    };
            parameters2[0].Value = 1;
            MySqlDataReader myreader2 = MySqlHelper.ExecuteReader(mysql2, parameters2);
            MapEntity map2 = new MapEntity(42);
            while (myreader2.Read())
            {
                //计算距离
                int distx = System.Math.Abs(map.vertexList[myreader2.GetInt32(2)-1].x - map.vertexList[myreader2.GetInt32(3)-1].x);
                int disty = System.Math.Abs(map.vertexList[myreader2.GetInt32(2)-1].y - map.vertexList[myreader2.GetInt32(3)-1].y);
                map.dist[myreader2.GetInt32(2), myreader2.GetInt32(3)] = (int)System.Math.Sqrt(distx*distx+disty*disty);
            }
            myreader2.Close();
            return map;
        }
    }
}