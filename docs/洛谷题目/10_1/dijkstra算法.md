!!! tip
    [B站讲解](https://www.bilibili.com/video/BV1MU4y1D729)  
    [CSDN](https://blog.csdn.net/SWEENEY_HE/article/details/81368342)

## 1. Dijkstra 算法

Dijkstra 是一种用于求 **单源最短路径** 的经典算法。

意思是：

> 从一个起点出发，求它到其他所有点的最短距离。

例如：

```text
1号点到2号点最短多远
1号点到3号点最短多远
1号点到n号点最短多远
```

都可以用 Dijkstra。

## 2. 适用条件

Dijkstra 适用于：

> 边权值非负（不能有负边）

例如：

```text 
A -> B 花费 5
A -> C 花费 2
```

权值表示：

* 距离
* 时间
* 花费
* 代价

只要不出现负数，一般可用 Dijkstra。

## 3. 核心思想

每次从当前未确定的点中，选出：

> 距离起点最近的点

然后用它去更新其他点距离。

就像石子落水：

* 起点距离是 0
* 最近点先确定
* 再不断向外扩展

## 4. 举例理解

图：

```text 
1 --2--> 2
1 --5--> 3
2 --1--> 3
```

从 `1` 出发。

初始：

```text 
dis[1]=0
dis[2]=∞
dis[3]=∞
```

先更新：

```text 
dis[2]=2
dis[3]=5
```

再选最近点 `2`，通过它更新：

```text 
dis[3]=min(5, 2+1)=3
```

最终：

```text 
1 到 3 最短路 = 3
```

## 5. 基础版（邻接矩阵）

适合稠密图、小数据。

```cpp 
#include <iostream>
#include <cstring>
using namespace std;

const int INF = 1e9;
int g[105][105];
int dis[105];
bool vis[105];
int n, m;

void dijkstra(int s)
{
    for(int i = 1; i <= n; i++)
        dis[i] = INF;

    dis[s] = 0;

    for(int i = 1; i <= n; i++)
    {
        int u = -1;

        for(int j = 1; j <= n; j++)
        {
            if(!vis[j] && (u == -1 || dis[j] < dis[u]))
                u = j;
        }

        vis[u] = true;

        for(int v = 1; v <= n; v++)
        {
            dis[v] = min(dis[v], dis[u] + g[u][v]);
        }
    }
}
```

复杂度：

```text 
O(n²)
```

## 6. 堆优化版（最常用）

适合大数据、稀疏图。

使用：

```cpp 
priority_queue
```

复杂度：

```text 
O((n+m)logn)
```

## 7. 堆优化模板（竞赛常用）

```cpp 
#include <iostream>
#include <vector>
#include <queue>
using namespace std;

const int INF = 1e9;
const int N = 100005;

vector<pair<int,int>> g[N];
int dis[N];
bool vis[N];
int n, m;

void dijkstra(int s)
{
    for(int i = 1; i <= n; i++)
        dis[i] = INF;

    priority_queue<
        pair<int,int>,
        vector<pair<int,int>>,
        greater<pair<int,int>>
    > q;

    dis[s] = 0;
    q.push({0, s});

    while(!q.empty())
    {
        int u = q.top().second;
        q.pop();

        if(vis[u]) continue;
        vis[u] = true;

        for(auto e : g[u])
        {
            int v = e.first;
            int w = e.second;

            if(dis[v] > dis[u] + w)
            {
                dis[v] = dis[u] + w;
                q.push({dis[v], v});
            }
        }
    }
}
```

## 8. 为什么要用优先队列

因为每次都要找：

> 当前距离最小的点

普通找法：

```text 
O(n)
```

优先队列找最小值更快。

## 9. 常见题型

**最短路径**

起点到终点最短距离。

**最少花费**

最小费用到达目标。

**最短时间**

城市交通、地铁路线。

**多次询问单源最短路**

先跑一次，再回答多个点。

## 10. 常见错误

**图有负边还用 Dijkstra**

会出错。

负边应用 Bellman-Ford / SPFA。

**数组没初始化**

```cpp 
dis[i] = INF
```

必须初始化。

**重复入堆不会处理**

堆优化版要写：

```cpp 
if(vis[u]) continue;
```

**无向图只加单边**

无向图应加两次边。

## 11. 如何判断使用 Dijkstra

看到这些关键词：

* 最短路
* 最少花费
* 最快到达
* 边权非负
* 单个起点

通常考虑 Dijkstra。

## 12. 一句话理解

> Dijkstra = 每次确定离起点最近的点，并更新周围距离。

## 13. 总结

Dijkstra 是图论最重要算法之一。

记住三点：

* 求单源最短路
* 不能有负边
* 堆优化最常用

蓝桥杯、算法课、竞赛题中非常高频。
