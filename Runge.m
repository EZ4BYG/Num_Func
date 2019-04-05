clc; clear;

% 关于1/(1+x^2)函数的龙贝格现象
xnum = -5:1:5;
% ynum = 1./(1+xnum.^2);
% ynum = sin(xnum)./(1+xnum.^2);
 ynum = (1-xnum)./( 2 - cos(xnum) + xnum.^2);
syms x L;  % L是记录最后表达式的

n = length(xnum);     % 记录总长度(阶次)
l = sym(zeros(1,n));  % 创建符号数组
for m = 1:n
    % 这里很巧妙: 
    % prod是数组元素的累乘 e.g. prod([1 2 3 5]) = 1*2*3*5 = 30
    % [1:m-1 m+1:n] 刚好把当下的m索引去掉！只要除了m序号的所有元素
    l(m) = prod(x - xnum([1:m-1 m+1:n]))/prod(xnum(m) - xnum([1:m-1 m+1:n]));
    l(m) = l(m)*ynum(m);
end

L = sum(l);   % n阶插值表达式

x = -5:0.1:5;
y = double(subs(L));  % L就当做连续函数表达式处理就行
% y1 = 1./(1+x.^2);   % 每次改变测试函数, 这里记得修改!
% y1 = sin(x)./(1+x.^2);
y1 = (1-x)./(2 - cos(x) + x.^2);
plot(x,y,'k');
hold on;
plot(x,y1,'r');
grid on;
title('黑线是高阶拉格朗日插值;红线为原始函数');



