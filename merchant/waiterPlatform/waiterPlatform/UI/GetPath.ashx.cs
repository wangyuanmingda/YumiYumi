using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using yumiyumiDB;

namespace waiterPlatform.UI
{
    /// <summary>
    /// GetPath 的摘要说明
    /// </summary>
    public class GetPath : IHttpHandler
    {
        int[,] A;
        public string number;
        public string js;
        const int MAXINT = 32767;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int to = Convert.ToInt32(context.Request.QueryString["to"]);
            MapDAO mm = new MapDAO();
            MapEntity entity = mm.getMap();
            Dijkstra dijkstra = new Dijkstra();
            int[] pre = dijkstra.run(38, entity.dist, 41);
            StringBuilder sb = new StringBuilder();
            sb.Append(" var canvas = document.getElementById('demoCanvas');");
            sb.Append(" var ctx = canvas.getContext('2d');");
            sb.Append(" var image = new Image();");
            sb.Append(" image.src = 'img/timg.jpg';");//设置图片的路径
            sb.Append(" image.onload = function () {");//当图片加载完成后
            sb.Append("  context.drawImage(image, 0, 0);");
            
          
            
            sb.Append(" context.beginPath();");

            int endpoint = to;
            int ss = pre[endpoint];
            sb.Append("context.moveTo(" + entity.vertexList[endpoint - 1].x + ", " + entity.vertexList[endpoint - 1].y + ");"); // 设置路径起点，坐标为(20,20)
            sb.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
            number = "1<-" + ss + "<-";
            while (ss != 38)
            {
                ss = pre[ss];
                sb.Append("context.lineTo(" + entity.vertexList[ss - 1].x + ", " + entity.vertexList[ss - 1].y + ");"); // 绘制一条到(200,20)的直线
                number += ss + "<-";
            }
            sb.Append("context.lineWidth = 2.0;");// 设置线宽
            sb.Append("context.strokeStyle = '#CC0000';"); // 设置线的颜色
            sb.Append("context.stroke();"); // 进行线的着色，这时整条线才变得可见
            sb.Append(" };");
            js = sb.ToString();
            context.Response.Write(js);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}