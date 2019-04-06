% 任意多项式拟合数据点, 当然最好不要超过6阶

clear; clc;

% 这里修改原始观测数据:
xnum = 1:10;
ynum = [3.8 6.3 7.9 8.6 9.2 9.5 9.7 9.9 10.1 10.2];

m = double(input('拟合阶数m = '));
n = length(xnum);

% 等号左边矩阵: 每个元素的幂 = row + col -2
A = zeros(m+1,m+1);
for row = 1:m+1
    for col = 1:m+1
        A(row,col) = sum(xnum.^(row+col-2));
    end
end

% 等号右边矩阵: 一行m+1列
B = zeros(m+1,1);
for num = 1:m+1
    B(num,1) = sum((xnum.^(num-1)).*ynum);
end

% 多项式系数/方程求解:
a = inv(A)*B;

syms x;
ytmp = sym(zeros(1,m+1));
for num = 1:num
    ytmp(num) = x^(num-1);
end
fprintf('拟合结果为:\n');
y = vpa(sum(ytmp.*a'),6)   % 拟合的多项式结果

figure(1);
scatter(xnum,ynum);
hold on;
x = min(xnum):0.1:max(xnum);
y = double(subs(y));
plot(x,y);
grid on;
xlabel('x'); ylabel('y');
title('原点为样本点;实线为多项式拟合结果');