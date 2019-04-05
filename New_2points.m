clear; clc;

x0 = 4; x1 = 9;
y0 = sqrt(x0); y1 = sqrt(x1);

syms x;

f01 = (y0 - y1)/(x0 - x1);  % 0,1两点一阶差商f01
N = y0 + f01*(x-x0);

x = double(input('输入测试数据x = '));    % 最好就在[xmin,xmax]之间
fprintf('近似结果N = %f\n',double(subs(N)));  % 函数表达式赋值
fprintf('真实结果Y = %f\n',sqrt(x));

