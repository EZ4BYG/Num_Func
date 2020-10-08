# Nonlinear Equations Solutions

Contents: Various common and useful iterative methods for solving nonlinear equations

# Time：2019.05.05
The solution methods of the nonlinear equations. The programs are in the **Nonlinear_Equations** folder.
- Original Newton method + pre-Gauss-Seidel iteration —— **niudun.m**  and **pre_seidel.m**
- Modified Newton method —— **xzniudun.m**
- Quasi-Newton Method(single rank inverse Broyden Ⅰ) —— **nbroyden1.m**
- Quasi-Newton Method(single rank inverse Broyden Ⅱ)  —— **nbroyden2.m**
- Quasi-Newton Method(rank-two BFS) —— **BFS.m**
- You can see more detailed interpretation from my blog: https://www.jianshu.com/p/4e2d6a45aa67

---

# 非线性方程组的求解

内容：各种常见且好用的非线性方程组迭代求解方法。

# 时间：2019.05.05

更新1：非线性方法组的求解方法，使用了5种最好用最实用的牛顿法和拟牛顿法
- 原始牛顿法(文件名：niudun.m)，辅助求解线性方法组的万能高斯-赛德尔迭代函数(文件名：pre_seidel.m)；
- 修正牛顿法(文件名：xzniudun.m)；
- 拟牛顿法_逆Broyden秩1法(文件名：nbroyden1.m)；
- 拟牛顿法_逆Broyden秩1第二方法(文件名：nbroyden2.m)；
- 拟牛顿法_BFS秩2法(文件名：BFS.m)；
- [相关说明参考这里](https://www.jianshu.com/p/4e2d6a45aa67)
