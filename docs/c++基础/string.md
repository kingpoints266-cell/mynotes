可以，下面是精简后的 **蓝桥杯常用 C++ 字符串函数总结（Markdown版）**，只保留比赛里高频会用到的。

---

# 蓝桥杯常用 C++ 字符串函数总结

## 头文件

```cpp
#include <iostream>
#include <string>
#include <algorithm>
using namespace std;
```

---

# 1. `to_string()`

## 作用

把数字转成字符串。

## 用法

```cpp
string s = to_string(123);
string t = to_string(3.14);
```

## 例子

```cpp
int x = 123;
string s = to_string(x);
cout << s << endl; // 123
```

## 常见用途

- 数字拆位
    
- 拼接字符串
    
- 枚举答案时把数字转字符串处理
    

---

# 2. `stoi()`

## 作用

把字符串转成整数。

## 用法

```cpp
int x = stoi("123");
```

## 例子

```cpp
string s = "456";
int x = stoi(s);
cout << x + 1 << endl; // 457
```

## 常见用途

- 读入的是字符串，但要按数字处理
    
- 截取一段子串后转整数
    

---

# 3. `size()` / `length()`

## 作用

求字符串长度。

## 用法

```cpp
string s = "hello";
cout << s.size() << endl;
cout << s.length() << endl;
```

## 说明

- 两个完全一样
    
- 比赛里更常写 `size()`
    

## 例子

```cpp
string s = "abcde";
cout << s.size() << endl; // 5
```

---

# 4. `substr()`

## 作用

截取子串。

## 语法

```cpp
s.substr(pos, len)
```

- `pos`：起始下标
    
- `len`：长度
    

## 例子

```cpp
string s = "abcdef";
cout << s.substr(2, 3) << endl; // cde
cout << s.substr(3) << endl;    // def
```

## 常见用途

- 截取一段数字
    
- 模拟切片
    
- 判断某一段内容
    

## 易错点

`substr(2, 3)` 表示从下标 2 开始取 **3 个字符**，不是取到下标 3。

---

# 5. `find()`

## 作用

查找字符或子串第一次出现的位置。

## 用法

```cpp
s.find("abc");
s.find('a');
```

## 例子

```cpp
string s = "hello world";
cout << s.find("world") << endl; // 6
cout << s.find('o') << endl;     // 4
```

## 找不到时

返回：

```cpp
string::npos
```

## 常用判断

```cpp
if (s.find("abc") != string::npos) {
    cout << "找到了" << endl;
}
```

## 常见用途

- 判断子串是否存在
    
- 查找某个字符位置
    
- 模拟匹配
    

---

# 6. `erase()`

## 作用

删除字符串的一部分。

## 语法

```cpp
s.erase(pos, len);
```

## 例子

```cpp
string s = "hello world";
s.erase(5, 1);
cout << s << endl; // helloworld
```

## 常见用途

- 删除某个字符
    
- 删除一段区间
    
- 模拟字符串操作题
    

---

# 7. `insert()`

## 作用

在指定位置插入字符串。

## 例子

```cpp
string s = "abcd";
s.insert(2, "XYZ");
cout << s << endl; // abXYZcd
```

## 常见用途

- 模拟插入操作
    
- 构造新字符串
    

---

# 8. `replace()`

## 作用

替换字符串中的某一段。

## 语法

```cpp
s.replace(pos, len, str);
```

## 例子

```cpp
string s = "hello world";
s.replace(6, 5, "C++");
cout << s << endl; // hello C++
```

## 常见用途

- 模拟替换题
    
- 局部修改字符串
    

---

# 9. `push_back()`

## 作用

在字符串末尾添加一个字符。

## 例子

```cpp
string s = "abc";
s.push_back('d');
cout << s << endl; // abcd
```

## 常见用途

- 构造答案字符串
    
- 模拟高精度
    
- 逐字符拼接
    

---

# 10. `pop_back()`

## 作用

删除字符串最后一个字符。

## 例子

```cpp
string s = "abcd";
s.pop_back();
cout << s << endl; // abc
```

## 常见用途

- 去掉末尾字符
    
- 回溯 / 模拟过程
    

---

# 11. `clear()`

## 作用

清空字符串。

## 例子

```cpp
string s = "hello";
s.clear();
cout << s.size() << endl; // 0
```

---

# 12. `empty()`

## 作用

判断字符串是否为空。

## 例子

```cpp
string s = "";
if (s.empty()) {
    cout << "空字符串" << endl;
}
```

---

# 13. 字符串拼接

## 方法一：`+`

```cpp
string a = "hello";
string b = "world";
string c = a + " " + b;
cout << c << endl; // hello world
```

## 方法二：`+=`

```cpp
string s = "abc";
s += "def";
cout << s << endl; // abcdef
```

## 常见用途

- 拼答案
    
- 构造目标串
    
- 数字转字符串后继续拼接
    

---

# 14. 字符访问

## 下标访问

```cpp
string s = "hello";
cout << s[0] << endl; // h
s[1] = 'a';
cout << s << endl;    // hallo
```

## 常见用途

- 遍历每一位字符
    
- 判断数字 / 字母
    
- 修改某一位
    

## 常见写法

```cpp
for (int i = 0; i < s.size(); i++) {
    cout << s[i] << ' ';
}
```

---

# 15. `reverse()`

## 作用

反转字符串。

## 用法

```cpp
reverse(s.begin(), s.end());
```

## 例子

```cpp
string s = "abcd";
reverse(s.begin(), s.end());
cout << s << endl; // dcba
```

## 常见用途

- 回文题
    
- 高精度加法结果翻转
    
- 倒序处理字符串
    

---

# 16. 排序 `sort()`

## 作用

对字符串中的字符排序。

## 用法

```cpp
sort(s.begin(), s.end());
```

## 例子

```cpp
string s = "dcab";
sort(s.begin(), s.end());
cout << s << endl; // abcd
```

## 常见用途

- 判断两个串是否为重排关系
    
- 贪心构造最小 / 最大字典序
    
- 全排列前的预处理
    

---

# 蓝桥杯最常见模板

## 1. 遍历字符串

```cpp
for (int i = 0; i < s.size(); i++) {
    cout << s[i] << endl;
}
```

---

## 2. 判断某个子串是否存在

```cpp
if (s.find("abc") != string::npos) {
    cout << "存在" << endl;
}
```

---

## 3. 截取一段字符串

```cpp
string t = s.substr(l, len);
```

---

## 4. 反转字符串

```cpp
reverse(s.begin(), s.end());
```

---

## 5. 排序字符串

```cpp
sort(s.begin(), s.end());
```

---

## 6. 数字和字符串互转

```cpp
int x = 123;
string s = to_string(x);

string t = "456";
int y = stoi(t);
```

---

# 蓝桥杯高频考点

## 1. 回文判断

```cpp
string t = s;
reverse(t.begin(), t.end());
if (t == s) cout << "是回文";
```

---

## 2. 统计字符个数

```cpp
int cnt = 0;
for (char c : s) {
    if (c == 'a') cnt++;
}
```

---

## 3. 判断是否包含某段字符串

```cpp
if (s.find("2024") != string::npos) {
    cout << "有" << endl;
}
```

---

## 4. 按位处理数字串

```cpp
string s;
cin >> s;
for (int i = 0; i < s.size(); i++) {
    int x = s[i] - '0';
    cout << x << endl;
}
```

---

# 易错点

## 1. `find()` 找不到不是返回 `-1`

正确写法：

```cpp
if (s.find("abc") == string::npos) {
    cout << "没找到" << endl;
}
```

---

## 2. `substr(pos, len)` 第二个参数是长度

```cpp
string s = "abcdef";
cout << s.substr(2, 3) << endl; // cde
```

---

## 3. 字符转数字要减 `'0'`

```cpp
int x = s[i] - '0';
```

不是：

```cpp
int x = s[i];
```

---

# 最后速查表

|函数/操作|作用|
|---|---|
|`to_string(x)`|数字转字符串|
|`stoi(s)`|字符串转整数|
|`size()`|求长度|
|`substr(pos, len)`|截取子串|
|`find(x)`|查找第一次出现位置|
|`erase(pos, len)`|删除一段|
|`insert(pos, str)`|插入|
|`replace(pos, len, str)`|替换|
|`push_back(ch)`|末尾加字符|
|`pop_back()`|删除末尾字符|
|`clear()`|清空|
|`empty()`|判空|
|`+` / `+=`|拼接字符串|
|`s[i]`|访问某一位字符|
|`reverse()`|反转|
|`sort()`|排序|

---

你要的话，我还能继续帮你整理成一份 **更适合背诵的“蓝桥杯 string 极简模板版”**，只保留十几个最核心结论。