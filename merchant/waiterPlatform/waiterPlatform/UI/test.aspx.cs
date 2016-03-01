using System;
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
        const int MAXINT = 32767;

        protected void Page_Load(object sender, EventArgs e)
        {
            MapDAO mm = new MapDAO();
            MapEntity entity = mm.getMap();
            Dijkstra dijkstra = new Dijkstra();
            int[] pre = dijkstra.run(38,entity.dist,41);
            StringBuilder sb = new StringBuilder();

            int endpoint = 5;
            int ss = pre[endpoint];
            sb.Append("context.moveTo(" + entity.vertexList[endpoint - 1].x + ", " + entity.vertexList[endpoint-1].y + ");"); // 设置路径起点，坐标为(20,20)
            sb.Append("context.lineTo(" + entity.vertexList[ss-1].x + ", " + entity.vertexList[ss-1].y + ");"); // 绘制一条到(200,20)的直线
            number = "1<-" + ss + "<-";
            while(ss!=38){
                ss = pre[ss];
                sb.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                number += ss + "<-";
            }
            js = sb.ToString();
        }
    }
}