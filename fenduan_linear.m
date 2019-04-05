clear; clc;

xnum = [1 2 2.3 5.1 6.2 6.8 8 8.4 9.1];  
ynum = sqrt(xnum);  % 针对的sqrt(x)的函数,其他函数都同理

n = length(xnum);
syms x L;
L_tmp = sym(zeros(1,n-1));

% 每一段(两个相邻点)拉格朗日插值直线:
for m = 1:n-1
    l0 = (x-xnum(m+1))/(xnum(m)-xnum(m+1));
    l1 = (x-xnum(m))/(xnum(m+1)-xnum(m));
    L_tmp(m) = ynum(m)*l0 + ynum(m+1)*l1;
end

% 分段函数做图没有问题:就是一段一段画而已
figure(1);
for m = 1:n-1
    x = [xnum(m),xnum(m+1)];
    y = double(subs(L_tmp(m)));
    plot(x,y);
    hold on;
end
grid on;

% 原始函数图像(画到一起)
x1 = xnum(1):0.1:xnum(n);
y1 = sqrt(x1);
plot(x1,y1,'--k');
title('分段线性近似y=sqrt(x)函数');
xlabel('x');  ylabel('y');