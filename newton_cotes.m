% n点牛顿-科茨求积公式
% 思路: 先将[a,b]区间n等分, 然后n+1个点用n+1点(n次)拉格朗日插值
% 缺点: 高阶拉格朗日插值对于复杂弯曲函数龙贝格现象严重！不要插过6阶！
% 以f(x) = 4/(1+x^2)函数为例

clear; clc;

up = double(input('输入积分上限:'));
low = double(input('输入积分下限:'));
n = double(input('将积分区域几等分(几阶拉格朗日插值多项式):'));

% 算当前n等分牛顿-科茨系数Cn 
Cn = zeros(1,n+1); 
syms t;
% s=sym(1)符号变量类型的1, 主要是为了一开始的循环相乘
for i = 0:n
    s = sym(1);
    for num = 0:n
        if num ~= i
            s = s*(t-num);
        end
    end
    Cn(i+1) = (-1)^(n-i)/( n*factorial(i)*factorial(n-i) )*int(s,t,0,n)
end

syms x;
f = 4/(1+x^2);  % 每次修改这里的函数
R = int(f,x,low,up);    % 真实结果
x = low:(up-low)/n:up;  % n等分后每个点的x值
fx = double(subs(f));   % n等分后每个x点对应的函数值

% 近似结果为:
NC = (up-low)*sum(Cn.*fx);
fprintf('牛顿-科茨求积公式近似结果为: %.7f\n',NC);
fprintf('真实结果为: %f\n',R);
        


