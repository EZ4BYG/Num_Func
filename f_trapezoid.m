% n点复化求积公式——万能！
% 思路: 先将[a,b]区间n等分, 然后每两点间用线性拉格朗日插值——分段线性插值而已。
% 优势: 避免高阶牛顿-科茨(高阶)出现龙贝格现象, 因此等分越多越好!
% 以f(x) = 4/(1+x^2)函数为例

clear; clc;

syms x;
f = 4/(1+x^2);   % 每次这里修改不同函数即可

up = double(input('输入积分上限:'));
low = double(input('输入积分下限:'));
n = double(input('将积分区间几等分:'));
% 真实定积分的结果: 
R = int(f,x,low,up); 

xnum = low:(up-low)/n:up;
fmiddle = zeros(1,n-1);  % 对中间那些结果的记录
for num = 1:n-1
    x = low + num*(up-low)/n;
    fmiddle(num) = double(subs(f));
end

x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));
% 复化梯形公式近似结果:
FT = (up-low)/(2*n)*( flow + 2*sum(fmiddle) + fup ); 

fprintf('复化梯形求积公式近似结果为: %.7f\n',FT);
fprintf('真实结果为: %f\n',R);
    

