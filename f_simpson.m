% n点复化辛普森公式——万能！比复化梯形更准！
% 思路: 先将[a,b]区间n等分, 然后每两点间再插入一个中心节点！每一份3个点做3点(2阶)拉格朗日插值
% 优势: 避免高阶牛顿-科茨(高阶)出现龙贝格现象, 因此等分越多越好!
% 以f(x) = 4/(1+x^2)函数为例

clear; clc;

syms x;
f = 4/(1+x^2);   % 每次这里修改不同函数即可

up = double(input('输入积分上限:'));
low = double(input('输入积分下限:'));
n = double(input('将积分区间n等分(偶数):'));
m = n/2;
% 真实定积分的结果: 
R = int(f,x,low,up); 

fmiddle1 = zeros(1,m);    % 对大括号中第一项的记录
fmiddle2 = zeros(1,m-1);  % 对大括号中第二项的记录
for num1 = 1:m
    x = low + (2*num1-1)*(up-low)/(2*m);
    fmiddle1(num1) = double(subs(f));
end

for num2 = 1:m-1
    x = low + (2*num2)*(up-low)/(2*m);
    fmiddle2(num2) = double(subs(f));
end

x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));
% 复化梯形公式近似结果:
FS = (up-low)/(6*m)*( flow + 4*sum(fmiddle1) + 2*sum(fmiddle2) + fup ); 

fprintf('复化梯形求积公式近似结果为: %.7f\n',FS);
fprintf('真实结果为: %f\n',R);
    

