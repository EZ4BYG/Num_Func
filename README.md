# NumFunc

Contents: Numerical analysis toolbox and iterative solution toolbox for linear/nonlinear equations

# Time: 2019.04.06
- Lagrange interpolation: 2-points, 3-points, n-points; Runge's phenomenon —— **lagra_2points.m**, **largra_3points.m**, **lagra_npoints.m** and **Runge.m**
- Newton interpolation: 2-points, 3-points, n-points —— **New_2points.m**, **New_3points.m** and **New_npoints.m**
- Piecewise-linear Lagrangian interpolation —— **fenduan_linear.m**
- Unary nonlinear fitting —— **nonlinear_fitting.m**
- More detailed interpretation about Interpolation: https://www.jianshu.com/p/add2e938271c
- More detailed interpretation about Fitting: https://www.jianshu.com/p/41caace02f39

# Time：2019.04.07
- Lagrangian integral(basic): Trapezoidal formula, Simpson formula, Newton-Coates formula —— **trapezoid.m**, **simpson.m** and **newton_cotes.m**
- Lagrangian integral(intermediate): Composite trapezoid formula, Composite Simpson formula —— **f_trapezoid.m** and **f_simpson.m**
- Lagrangian integral(advanced): 
- 拉格朗日型积分(基础款)：梯形公式、辛普森公式、牛顿-科茨公式(文件名：trapezoid.m、simpson.m、newton_cotes.m)；
- 拉格朗日型积分(进阶款)：复化梯形公式、复化辛普森公式(文件名：f_trapezoid.m、f_simpson.m)；
- 拉格朗日型积分(高级款)：复化梯形加密公式、龙贝格公式(文件名：jm_f_trapezoid.m、romberg_js.m)；
- 高斯型积分公式：高斯-勒让德、高斯-拉盖尔、高斯-埃尔米特；包括插值节点和系数的求取，以及实例(文件名：gauss_legendre2.m、gauss_laguerre.m、gauss_hermite.m)。
- [相关说明参考这里](https://www.jianshu.com/p/c6fdfe11e6bc)

---

# 数值分析和方程求解

内容：数值分析相关程序包括插值、拟合、数值积分；方程求解包括线性方程组迭代求解、非线性方程(组)求解、常微分方程数值解

# 时间：2019.04.06

更新1：多项式插值相关程序；最小二乘一元非线性拟合程序。

- 拉格朗日插值：2点、3点、n点拉格朗日插值、龙格现象(文件名：lagra_2points.m、largra_3points.m、lagra_npoints.m、Runge.m)；
- 牛顿插值：2点、3点、n点牛顿插值(文件名：New_2points.m、New_3points.m、New_npoints.m)；
- 分段线性拉格朗日插值(文件名：fenduan_linear.m)；
- 一元非线性拟合(文件名：nonlinear_fitting.m)。
- [插值说明参考这里](https://www.jianshu.com/p/add2e938271c)；[拟合说明参考这里](https://www.jianshu.com/p/41caace02f39)

# 时间：2019.04.07

更新2：数值积分相关程序。

- 拉格朗日型积分(基础款)：梯形公式、辛普森公式、牛顿-科茨公式(文件名：trapezoid.m、simpson.m、newton_cotes.m)；
- 拉格朗日型积分(进阶款)：复化梯形公式、复化辛普森公式(文件名：f_trapezoid.m、f_simpson.m)；
- 拉格朗日型积分(高级款)：复化梯形加密公式、龙贝格公式(文件名：jm_f_trapezoid.m、romberg_js.m)；
- 高斯型积分公式：高斯-勒让德、高斯-拉盖尔、高斯-埃尔米特；包括插值节点和系数的求取，以及实例(文件名：gauss_legendre2.m、gauss_laguerre.m、gauss_hermite.m)。
- [相关说明参考这里](https://www.jianshu.com/p/c6fdfe11e6bc)

# 时间：2019.04.15

更新3：线性方程组迭代求解相关程序。

- **未预处理**原始迭代方法：雅克比迭代、高斯-赛德尔迭代、(超)松弛迭代(文件名：jacobian_iteration.m、seidel_iteration.m、relaxation_iteration.m)；
- **预处理**后**万能**迭代方法(**推荐√**)：预处理后万能高斯-赛德尔迭代、预处理后万能(超)松弛迭代(文件名：pre_seidel.m、pre_relaxation.m)。
- **对角最大化预处理**：非万能，但还是可以提高迭代收敛的几率，值得参考(文件名: diagonal_maximization.m)
- 预处理参考文献：《Jacobi和Gauss-Seidel迭代法的预处理》
- [相关说明参考这里](https://www.jianshu.com/p/e14d9e910984)

# 时间：2019.04.15

更新4：超定不相容线性方程组最小二乘近似解

- 最小二乘法近似求解(文件名：overdetermined_linear.m)；
- [相关说明参考这里](https://www.jianshu.com/p/3d8abb3ba7d3)

# 时间：2019.04.27

更新5：广义加号逆矩阵求解线性方程组

- 任意矩阵的满秩分解(文件名：FRD.m)；
- 线性方程组无解：广义加号逆求**全部**最小二乘解和**唯一极小范数**最小二乘解(文件名：wujie.m)；
- 线性方程组无穷解：广义加号逆求**通解**和**唯一极小范数解**(文件名：wuqiongjie.m)；
- 线性方程组唯一解：广义加号逆求唯一解(文件名：weiyijie.m)；
- [相关说明参考这里](https://www.jianshu.com/p/8777e5d11a03)

# 时间：2019.05.05

更新6：非线性方法组的求解方法，详见文件夹Nonlinear_Equations
- 原始牛顿法(文件名：niudun.m)，辅助求解线性方法组的万能高斯-赛德尔迭代函数(pre_seidel.m)；
- 修正牛顿法(文件名：xzniudun.m)；
- 拟牛顿法_逆Broyden秩1法(nbroyden1.m)；
- 拟牛顿法_逆Broyden秩1第二方法(nbroyden2.m)；
- 拟牛顿法_BFS秩2法(BFS.m)；
- [相关说明参考这里](https://www.jianshu.com/p/4e2d6a45aa67)
