% 两点辛普森求积公式
% 思路: 先将[a,b]区间二等分, 然后3个点用3点(2次)拉格朗日插值
% 以f(x) = 4/(1+x^2)函数为例

clear; clc;
format long;

syms x;
f = 4/(1+x^2);   % 每次这里修改不同函数即可

up = double(input('输入积分上限:'));
low = double(input('输入积分下限:'));
% 真实定积分的结果: 
R = int(f,x,low,up);  

x = up;
fup = double(subs(f));   % 上端点值 
x = low;
flow = double(subs(f));  % 下端点值
x = (up + low)/2;
fmiddle = double(subs(f));  % 中间点值

% 辛普森求积公式近似结果:
S = (up-low)/6*(fup + 4*fmiddle + flow);
fprintf('辛普森求积公式近似结果为: %.7f\n',S);
fprintf('真实结果为: %.7f\n',R);
