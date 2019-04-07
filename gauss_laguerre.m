% 任意个数插值节点的高斯-拉盖尔求积公式:
% 说明等信息同高斯-勒让德
% 用处: 原始待积函数形式中必须有一个exp(-x)项! 即f(x) = exp(-x)*g(x)
% 注意: 近似计算时用的是g(x)! 即Ai*g(xi)! 前面那个exp(-x)在近似计算中是不用的!

clear; clc;
format long;

syms x;
n = double(input('输入使用几点(n)的高斯-拉盖尔插值:'));
% n点插值的高斯-拉盖尔多项式P:
f = exp(-x)*x^n;
fprintf('%d点高斯-拉盖尔多项式为:\n',n)
L = vpa( exp(x) * diff(f,x,n) )
% n点高斯-拉盖尔插值节点Xi:
Xi = sort(double(solve(L)))';

% n点高斯-拉盖尔插值节点对应的插值系数Ai:
xnum = Xi;
% l用来记录拉格朗日多项式的: n点拉格朗日插值多项式有n个基函数! 
% 高斯-拉盖尔求积系数就是对"每个多项式/基函数"求其[0 +inf]定积分——
% 插值点数、多项式/基函数个数、求积系数个数一样，相互对应。
l = sym(zeros(1,n));  
Ai = zeros(1,n);
for m = 1:n
    l(m) = prod(x - xnum([1:m-1 m+1:n]))/prod(xnum(m) - xnum([1:m-1 m+1:n])); 
    l_tmp = exp(-x)*l(m);
    Ai(m) = double(int(l_tmp,x,0,+inf));
end

fprintf('%d点高斯-拉盖尔插值节点为:\n',n);
Xi
fprintf('%d点高斯-拉盖尔插值节点对应的系数为:\n',n);
Ai


% 对具体函数的积分近似: 高斯-拉盖尔积分限很简单,必须是[0,+inf]
syms t;
gt = sin(t);    % 每次修改这里的函数即可, 注意exp(-t)这一项必须有
y = exp(-t)*gt;   
up = +inf;
low = 0;
R = int(y,t,low,up);  % 实际结果

Result = 0;  % 记录最终近似结果
for num = 1:n
    t = Xi(num);
    y_tmp = double(subs(gt));
    Result = Result + Ai(num)*y_tmp;
end

fprintf('%d点高斯-拉盖尔积分近似结果为:%.10f\n', n, Result);
fprintf('真实结果为:%.10f\n', R);



