% 预处理原理: 在原始方程左右两边同时"左乘"原系数矩阵A的转置即可
% 新的方程形式: A^{T}Ax = A^{T}b → Bx = g 用这个新形式再用高斯-赛德尔迭代即可
% 效果: 预处理后新形式的方程，给定任意初值高斯-赛德尔万能收敛！！
% 为什么万能收敛: 因为预处理后得到的B，它是对称正定阵，对角元素一定大于0！！

clear; clc;

% 关于原方程组的迭代计算必备矩阵: 不同方程每次修改A和b即可。
A = [10 -1 2 0;-1 11 -1 3;2 -1 10 -1;0 3 -1 8];  % 系数矩阵
b = [7;14;-10;12];        % 等号右边结果(列矩阵)
% 预处理: 就是这么简单 
b = A'*b;
A = A'*A;
% 下面是正常的高斯-赛德尔操作: 
D = diag(diag(A));
L = tril(A,-1);     % 向左下移一格的下三角阵;
U = triu(A,1);      % 向右上移一格的上三角阵;
B2 = -inv(D+L)*U;   % 赛德尔迭代矩阵, 用来计算和判断收敛与否;
g2 = inv(D+L)*b;

if det(A) == 0
    fprintf('系数矩阵A为奇异矩阵,无法求解!\n');
    return ;
end

radius = max(abs(eig(B2)));  % 特征值有可能为复数, abs取绝对值 + 取模
if radius > 1
    fprintf('当前迭代不收敛!\n');
    return ;
else
    fprintf('赛德尔迭代矩阵谱半径为: %.4f\n',radius);
end
    
% 迭代计算部分:
x = zeros(length(b),1);  % 初始迭代4x1的矩阵(列矩阵): 初始值全为0
error = double(input('输入迭代精度(例如10^(-4)或0.0001):'));
count = 0;    % 迭代计数器
while 1
    tmp = B2*x + g2;
    if max(abs(tmp - x)) < error
        break;
    end
    x = tmp;
    count = count + 1;
end

fprintf('方程的解为: x1 = %.4f  x2 = %.4f  x3 = %.4f  x4 = %.4f\n',x(1),x(2),x(3),x(4));
fprintf('共迭代%d次\n',count);

