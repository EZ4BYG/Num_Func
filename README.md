# Numerical_Analysis
数值分析相关程序：插值、拟合、数值积分、线性方程组迭代求解、非线性方程求根、常微分方程数值解

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
- **预处理**后**万能**迭代方法：预处理后万能高斯-赛德尔迭代、预处理后万能(超)松弛迭代(文件名：pre_seidel.m、pre_relaxation.m)。
- [相关说明参考这里](https://www.jianshu.com/p/e14d9e910984)
