clc; clear;

x0 = 1; x1 = 2;
y0 = sqrt(x0); y1 = sqrt(x1);  % 测试sqrt(x)函数的2点拉格朗日插值(直线)

syms x;

l0 = (x-x1)/(x0-x1);  
l1 = (x-x0)/(x1-x0);  % 两个基函数
L = y0*l0 + y1*l1;

x = double(input('输入测试数据x:'));    % 最好就在[xmin,xmax]之间
fprintf('近似结果为:%f\n',double(subs(L)));  % 函数表达式赋值
fprintf('真实结果为:%f\n',sqrt(x));

figure(1);
x = 0:0.01:2;
plot(x,sqrt(x))
hold on;
