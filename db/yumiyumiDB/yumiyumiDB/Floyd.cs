using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace yumiyumiDB
{
    public class Floyd
    {
        public int[,] run(int[,] A,int n)
        {
            int k,i,j;
            int[,] e;
            e = new int[n+1, n+1];  
            for (k = 1; k <= n; k++)
                for (i = 1; i <= n; i++)
                    e[k, i] = A[k, i];
            for (k = 1; k <= n; k++)
                for (i = 1; i <= n; i++)
                    for (j = 1; j <= n; j++)
                        if (e[i,j] > e[i,k] + e[k,j])
                            e[i,j] = e[i,k] + e[k,j];
            return e;
        }
        const int MAXINT = 32767;

        public ArrayList getLatest(int v0, int[,] A, int MAXNUM,List<int> must)
        {

            ArrayList pre = new ArrayList();
            int[,] e= run(A, MAXNUM);
            for (int i = 0; i < must.Count; i++)//两个先合并，
            {
                for (int j = 0; j < must.Count; j++)
                {

                }
            }

           return pre;
        }

        public ArrayList getPath(ArrayList pointList, int[,] A, int n,int start)//输入必经点集合
        {
            int[,] dist = run(A,n);
            bool[] flag = new bool[n + 1];
            for (int i = 0; i <= n;i++ )
            {
                flag[i] = false;
            }
            ArrayList list = new ArrayList();
            list.Add(start);

            int reachPoint = start;
            for (int i = 0; i < pointList.Count; i++)
            {
                int min = MAXINT;
                for (int j = 1; j <= n; j++)
                {
                    if ((dist[reachPoint, j] < min) && (pointList.IndexOf(j)!=-1) && (!flag[j]))
                    {
                        min = dist[reachPoint,j];
                        reachPoint = j;
                        flag[j] = true;
                        list.Add(j);
                    }
                }
            }
                return list;
        }
    }
}
