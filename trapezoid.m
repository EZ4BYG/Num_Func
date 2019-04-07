% 两点梯形求积公式
% 思路: 用"2点拉格朗日插值多项式"代替被积函数f(x)
% 以f(x) = 4/(1+x^2)函数为例

clear; clc
format long;

syms x;
f = 4/(1+x^2);   % 每次这里修改不同函数即可

up = double(input('输入积分上限:'));
low = double(input('输入积分下限:'));
% 真实定积分的结果: 
R = int(f,x,low,up);  

x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));

% 梯形求积公式近似结果:
T = (up - low)/2*(fup+flow);
fprintf('梯形求积公式近似结果为: %f\n',T);
fprintf('真实结果为: %.8f\n',R);
