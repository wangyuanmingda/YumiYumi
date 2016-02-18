using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace waiterPlatform.Models
{
    public class MapEntity
    {
        public MapEntity(int num)
        {
            vertexList = new List<Vertex>();
            dist = new int[num,num];
            for (int i = 0; i < num; ++i)
            {
                for (int j = 0; j < num; ++j)
                {
                    dist[i, j] = 32767;
                }
            }
        }
        public int[,] dist;
        public List<Vertex> vertexList;
        public class Vertex{
            public Vertex(int x,int y)
            {
                this.x = x;
                this.y = y;
            }
            public int x;
            public int y;
        }

        public void addVertex(int x,int y){
            vertexList.Add(new Vertex(x,y));
        }
    }
}