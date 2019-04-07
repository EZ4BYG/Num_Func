% 任意个数插值节点的高斯-埃尔米特求积公式:
% 说明等信息同高斯-勒让德
% 用处: 原始待积函数形式中必须有一个exp(-x^2)项! 即f(x) = exp(-x^2)*g(x)
% 注意1: 近似计算时用的是g(x)! 即Ai*g(xi)! 前面那个exp(-x^2)在近似计算中是不用的!
% 注意2: 埃尔米特特殊! 当插值节点大于4个后, 只能用"奇数个数"的插值点!!!!!!!!
%        因为"解插值节点的方程"的解此时个数 < n 也就不能再往下计算了。

clear; clc;
format long;

syms x;
n = double(input('输入使用几点(n)的高斯-埃尔米特插值:'));
% n点插值的高斯-埃尔米特多项式P:
f = exp(-x^2);
fprintf('%d点高斯-埃尔米特多项式为:\n',n)
H = vpa( (-1)^(n-1) * exp(x^2) * diff(f,x,n) )
% n点高斯-埃尔米特插值节点Xi:
Xi = sort(double(solve(H)))'

% n点高斯-埃尔米特插值节点对应的插值系数Ai:
xnum = Xi;
% l用来记录拉格朗日多项式的: n点拉格朗日插值多项式有n个基函数! 
% 高斯-埃尔米特求积系数就是对"每个多项式/基函数"求其[-inf +inf]定积分——
% 插值点数、多项式/基函数个数、求积系数个数一样，相互对应。
l = sym(zeros(1,n));  
Ai = zeros(1,n);
for m = 1:n
    l(m) = prod(x - xnum([1:m-1 m+1:n]))/prod(xnum(m) - xnum([1:m-1 m+1:n])); 
    l_tmp = exp(-x^2)*l(m);
    Ai(m) = double(int(l_tmp,x,-inf,+inf));
end

fprintf('%d点高斯-埃尔米特插值节点为:\n',n);
Xi
fprintf('%d点高斯-埃尔米特插值节点对应的系数为:\n',n);
Ai


% 对具体函数的积分近似: 高斯-拉盖尔积分限很简单,必须是[-inf,+inf]
syms t;
gt = sin(t)^2;    % 每次修改这里的函数即可, 注意exp(-t)这一项必须有
y = exp(-t^2)*gt;   
up = +inf;
low = -inf;
R = int(y,t,low,up);  % 实际结果

Result = 0;  % 记录最终近似结果
for num = 1:n
    t = Xi(num);
    y_tmp = double(subs(gt));
    Result = Result + Ai(num)*y_tmp;
end

fprintf('%d点高斯-埃尔米特积分近似结果为:%.10f\n', n, Result);
fprintf('真实结果为:%.10f\n', R);



