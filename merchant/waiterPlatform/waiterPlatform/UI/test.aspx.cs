using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Apache.NMS;
using Apache.NMS.ActiveMQ;
using System.Text;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    public partial class test : System.Web.UI.Page
    {
        int[,] A;
        public string number;
        public string js;
        public string js2;
        public string js3;
        const int MAXINT = 32767;
        public string shortString;

        protected void Page_Load(object sender, EventArgs e)
        {
            MapDAO mm = new MapDAO();
            MapEntity entity = mm.getMap();
            Dijkstra dijkstra = new Dijkstra();

            StringBuilder sb = new StringBuilder();

            

            

            StringBuilder sb2 = new StringBuilder();
            Floyd floyd = new Floyd();
            ServiceDAO serviceDAO = new ServiceDAO();
            List<ServiceEntity> list = serviceDAO.getAllServiceByRestaurantId(1);
            ArrayList pointList = new ArrayList();
            for(int i=0;i<list.Count;i++){
                if (list[i].status == 0 && (pointList.IndexOf(list[i].user_id) == -1) && (list[i].service_type == 0))
                {
                    pointList.Add(list[i].user_id);
                }
            }
            ArrayList result = floyd.getPath(pointList,entity.dist,41,38);
            for (int i = 0; i < result.Count;i++ )
            {
                sb2.Append(result[i]+"->");
            }
            for (int i = 0; i < result.Count - 1; i++)
            {
                int[] pre = dijkstra.run((int)result[i], entity.dist, 41);
                int endpoint = (int)result[i+1];
                int ss = pre[endpoint];
                sb.Append("context.moveTo(" + entity.vertexList[endpoint - 1].x + ", " + entity.vertexList[endpoint - 1].y + ");"); // 设置路径起点，坐标为(20,20)
                sb.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                number = "1<-" + ss + "<-";
                while (ss != (int)result[i])
                {
                    ss = pre[ss];
                    sb.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                    number += ss + "<-";
                }

            }
            js = sb.ToString();
            number = js;
            shortString = sb2.ToString();


            StringBuilder sb3 = new StringBuilder();
            ArrayList pointList2 = new ArrayList();
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].status == 0 && (pointList2.IndexOf(list[i].user_id) == -1)&&(list[i].service_type==1))
                {
                    pointList2.Add(list[i].user_id);
                }
            }
            ArrayList result2 = floyd.getPath(pointList2, entity.dist, 41, 38);
            for (int i = 0; i < result2.Count - 1; i++)
            {
                int[] pre = dijkstra.run((int)result2[i], entity.dist, 41);
                int endpoint = (int)result2[i + 1];
                int ss = pre[endpoint];
                sb3.Append("context.moveTo(" + entity.vertexList[endpoint - 1].x + ", " + entity.vertexList[endpoint - 1].y + ");"); // 设置路径起点，坐标为(20,20)
                sb3.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                number = "1<-" + ss + "<-";
                while (ss != (int)result2[i])
                {
                    ss = pre[ss];
                    sb3.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                    number += ss + "<-";
                }

            }
            js2 = sb3.ToString();

            StringBuilder sb4 = new StringBuilder();
            ArrayList pointList3 = new ArrayList();
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].status == 0 && (pointList3.IndexOf(list[i].user_id) == -1) && (list[i].service_type == 2))
                {
                    pointList3.Add(list[i].user_id);
                }
            }
            ArrayList result3 = floyd.getPath(pointList3, entity.dist, 41, 38);
            for (int i = 0; i < result3.Count - 1; i++)
            {
                int[] pre = dijkstra.run((int)result3[i], entity.dist, 41);
                int endpoint = (int)result3[i + 1];
                int ss = pre[endpoint];
                sb4.Append("context.moveTo(" + entity.vertexList[endpoint - 1].x + ", " + entity.vertexList[endpoint - 1].y + ");"); // 设置路径起点，坐标为(20,20)
                sb4.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                number = "1<-" + ss + "<-";
                while (ss != (int)result3[i])
                {
                    ss = pre[ss];
                    sb4.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                    number += ss + "<-";
                }

            }
            js3 = sb4.ToString();

        }
    }
}