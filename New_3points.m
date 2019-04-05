clear; clc;

x0 = 1; x1 = 4; x2 = 9;
y0 = sqrt(x0); y1 = sqrt(x1); y2 = sqrt(x2); % 测试sqrt(x)函数的2点拉格朗日插值(直线)

syms x;

f01 = (y0 - y1)/(x0 - x1);  % 0 1两点一阶差商
f12 = (y1 - y2)/(x1 - x2);  % 1 2两点一阶差商
f012 = (f01 - f12)/(x0 - x2);  % 0 1 2三点二阶差商

N = y0 + f01*(x-x0) + f012*(x-x0)*(x-x1);

x = double(input('输入测试数据x = '));    % 最好就在[xmin,xmax]之间
fprintf('近似结果N = %f\n',double(subs(N)));  % 函数表达式赋值
fprintf('真实结果Y = %f\n',sqrt(x));