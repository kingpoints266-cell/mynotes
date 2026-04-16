!!! tip
    [B站讲解](https://www.bilibili.com/video/BV1wM41137vm/)    
    [CSDN](https://blog.csdn.net/weixin_65256277/article/details/143493212)

## 1. 🗺️ A* 算法
A* (A-Star) 是一种用于求 单源最短路径（特别是已知终点时）的启发式搜索算法。
意思是：

在庞大的地图或状态空间中，寻找从起点到终点的最优路线。
例如：

游戏中 NPC 自动寻路
地图导航的最短路线
解决八数码（拼图）复原
都可以用 A*。

## 2. ✅ 适用条件
A* 适用于：

边权值非负（与 Dijkstra 一样，不能有负边）
明确知道起点和终点
搜索空间巨大，普通盲目搜索会超时或超内存
只要能为目标设计出合理的“预估距离”，一般可用 A*。

## 3. 🧠 核心思想
每次从当前未确定的点中，选出：

综合预估总代价最小的点
然后用它去扩展周围的点。

核心公式：
$F = G + H$

$G$：从起点走到当前点的实际代价
$H$：从当前点走到终点的预估代价（启发函数）
$F$：总评估代价
优先选择 $F$ 值最小的节点向外扩展。

## 4. 📏 启发函数 (H值)
这是 A* 区别于其他算法的灵魂。

常见选法：

曼哈顿距离（网格图，只能上下左右四向移动）
欧几里得距离（可以任意方向移动的直线距离）
切比雪夫距离（网格图，允许八向移动）

## 5. 🍎 举例理解
网格图找路，起点到终点中间有堵墙：

Dijkstra：像水波一样四面八方均匀蔓延，直到碰到终点。
A*：像有雷达一样，直奔终点方向走，碰到墙再尝试绕路。
因为 $H$ 值的存在，算法有了明确的“方向感”。



## 6. ⚙️ 基础逻辑 (Open/Closed表)
Open 表（待检查队列）：

存放发现了、但还没扩展邻居的点。
Closed 表（已检查集合）：

存放已经彻底扩展完的点。
过程：

每次从 Open 表拿出 $F$ 最小的点，放入 Closed 表。
检查它的邻居，计算新的 $G$ 和 $F$ 放入 Open 表。

## 7. 💻 堆优化模板（竞赛常用）
适合网格寻路、状态空间搜索。
使用：

`priority_queue` 维护最小 $F$ 值。

```cpp
#include <iostream>
#include <queue>
#include <vector>
using namespace std;

const int INF = 1e9;

struct Node {
    int x, y, g, h, f;
    bool operator<(const Node& a) const {
        return f > a.f; // 优先队列，F值小的优先出队
    }
};

void astar(Node start, Node end) {
    priority_queue<Node> q;
    
    start.g = 0;
    start.h = get_h(start, end); // 计算启发值
    start.f = start.g + start.h;
    q.push(start);

    while(!q.empty()) {
        Node u = q.top();
        q.pop();

        if(u.x == end.x && u.y == end.y) {
            // 找到终点
            return;
        }

        if(vis[u.x][u.y]) continue;
        vis[u.x][u.y] = true;

        for(auto next : get_neighbors(u)) {
            int new_g = u.g + cost(u, next);
            
            if(new_g < dis[next.x][next.y]) {
                dis[next.x][next.y] = new_g;
                next.g = new_g;
                next.h = get_h(next, end);
                next.f = next.g + next.h;
                q.push(next);
            }
        }
    }
}
```

## 8. 🚀 为什么比 Dijkstra 快
Dijkstra 属于盲目搜索：

会探索很多背离终点的无用方向。
A* 带有启发性：

优先探索离终点“看起来更近”的方向，在广阔地图中遍历的节点数量大幅减少。

## 9. 🎯 常见题型
迷宫寻路
起点到终点的最少步数（带复杂障碍物）。
状态压缩与转化
八数码（15数码）问题求最少还原步数。
K短路问题
A* 配合其他图论算法求前 K 条最短路径。

## 10. ⚠️ 常见错误
H值高估实际距离

如果预估的 $H$ 大于实际距离，A* 可能找不到最优解，退化为普通贪心。
记住：$H$ 值必须小于或等于实际代价（可采纳性）。
没有使用优先队列

每次找最小 $F$ 变成 $O(n)$，导致严重超时。
未处理节点更新

如果在 Open 表中发现同一个点有更短的 $G$ 值，必须用新的状态更新入堆。

## 11. 🔍 如何判断使用 A*
看到这些关键词：

单起点到单终点（明确了具体目标）
地图/网格寻路
状态转移求最少步数
普通 BFS / Dijkstra 空间或时间爆炸
通常考虑 A*。

## 12. 💡 一句话理解
A* = Dijkstra 的求稳（实际走过的距离 $G$） + 贪心算法的直觉（预估剩下的距离 $H$）。

## 13. 📝 总结
A* 是人工智能和游戏开发中最强大的寻路算法之一。
记住三点：

用于单点到单点最优解
核心公式 $F = G + H$
$H$ 值绝对不能高估实际距离

接下来我们可以朝哪个方向继续探索？
1. **深入启发函数：** 探讨在不同类型的网格中，如何准确计算曼哈顿距离或切比雪夫距离。
2. **对比与演进：** 仔细剖析 A* 和 Dijkstra 在遍历底层逻辑上的直观差异。
3. **状态空间模型：** 看看如何把经典的“八数码拼图”转化为 A* 可以求解的图论问题。