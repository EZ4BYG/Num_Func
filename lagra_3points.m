clc; clear;

x0 = 1; x1 = 4; x2 = 9;
y0 = sqrt(x0); y1 = sqrt(x1); y2 = sqrt(x2); % 测试sqrt(x)函数的2点拉格朗日插值(直线)

syms x;

l0 = (x-x1)*(x-x2)/( (x0-x1)*(x0-x2) );  
l1 = (x-x0)*(x-x2)/( (x1-x0)*(x1-x2) );  
l2 = (x-x0)*(x-x1)/( (x2-x0)*(x2-x1) );  % 3个基函数
L = y0*l0 + y1*l1 + y2*l2;

x = double(input('输入测试数据x:'));     % 最好就在[xmin,xmax]之间
fprintf('近似结果为:%f\n',double(subs(L)));  % 函数表达式赋值
fprintf('真实结果为:%f\n',sqrt(x));