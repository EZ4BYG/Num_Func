% 线性方程组近似求解: 雅克比迭代"近似"求解线性方程组
% 说明1: 雅克比迭代矩阵B1是判断收敛与否的关键! B1的谱半径(B1的绝对值最大的特征值)要小于1。
% 说明2: 谱半径越小(<1)收敛速度越快!  

clear; clc;

% 关于原方程组的迭代计算必备矩阵: 不同方程每次修改A和b即可。
A = [10 -1 2 0;-1 11 -1 3;2 -1 10 -1;0 3 -1 8];  % 系数矩阵
b = [7;14;-10;12];        % 等号右边结果(列矩阵)
D = diag(diag(A));
E = eye(length(b));
B1 = E-inv(D)*A;    % 雅克比迭代矩阵, 用来计算和判断收敛与否

if det(A) == 0
    fprintf('系数矩阵A为奇异矩阵,无法求解!\n');
    return ;
end

radius = max(abs(eig(B1)));
if radius > 1
    fprintf('当前迭代不收敛!\n');
    return ;
else
    fprintf('雅克比迭代矩阵谱半径为: %.4f\n',radius);
end
    
% 迭代计算部分:
x = zeros(length(b),1);  % 初始迭代3x1的矩阵(列矩阵)
error = double(input('输入迭代精度(例如10^(-4)或0.0001):'));
count = 0;    % 迭代计数器
while 1
    tmp = B1*x + inv(D)*b;
    if max(abs(tmp - x)) < error
        break;
    end
    x = tmp;
    count = count + 1;
end

fprintf('方程的解为: x1 = %.4f  x2 = %.4f  x3 = %.4f\n',x(1),x(2),x(3));
fprintf('共迭代%d次\n',count);

