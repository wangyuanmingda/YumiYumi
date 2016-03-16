using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace yumiyumiDB
{
    class Floyd
    {
        int[,] run(int[,] A,int n)
        {
            int k,i,j;
            int[,] e;
            e = new int[n, n];  
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
    }
}
