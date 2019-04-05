clc; clear;

% xnum是单调变化的
xnum = [1 4 9 12 13 18];
ynum = sqrt(xnum);
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

L = sum(l)   % n阶插值表达式
% ezplot(L);   % 插值函数图像

x = input('输入测试值x = ');
fprintf('模拟结果为L = %f\n', double(subs(L)) );
fprintf('真实结果为Y = %f\n', sqrt(x));



