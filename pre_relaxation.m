% 预处理原理: 在原始方程左右两边同时"左乘"原系数矩阵A的转置即可
% 新的方程形式: A^{T}Ax = A^{T}b → Bx = g 用这个新形式再用(超)松弛迭代即可
% 效果: 新方程形式，0<w<2之间，对任意初值都收敛
% 本例给出的方程系数对角都是0, 用任意一种原始迭代方法都不行, 必须用预处理！

clear; clc;

% 关于原方程组的迭代计算必备矩阵: 不同方程每次修改A和b即可。
A=[0 1 1;1 0 1;1 1 0];  % 系数矩阵: 对角元素有0, 任何一种普通迭代都无法进行
b = [2;2;2];            % 等号右边结果(列矩阵)
% 预处理:
b = A'*b;
A = A'*A;
% 下面是正常的(超)松弛迭代操作: 
D = diag(diag(A));
L = tril(A,-1);    % 向左下移一格的下三角阵;
U = triu(A,1);     % 向右上移一格的上三角阵;
w = double(input('输入松弛因子w(一般0~2):'));
B3 = inv(D+w*L) * ( (1-w)*D - w*U );   % (超)松弛迭代矩阵, 用来计算和判断收敛与否;

if det(A) == 0
    fprintf('系数矩阵A为奇异矩阵,无法求解!\n');
    return ;
end

radius = max(abs(eig(B3)));  % 特征值有可能为复数, abs取绝对值 + 取模
if radius > 1
    fprintf('当前迭代不收敛!\n');
    return ;
else
    fprintf('松弛迭代矩阵谱半径为: %.4f\n',radius);
end
    
% 迭代计算部分:
x = zeros(length(b),1);  % 初始迭代3x1的矩阵(列矩阵)
error = double(input('输入迭代精度(例如10^(-4)或0.0001):'));
count = 0;    % 迭代计数器
while 1
    tmp = B3*x + w*inv(D+w*L)*b;
    if max(abs(tmp - x)) < error
        break;
    end
    x = tmp;
    count = count + 1;
end

fprintf('方程的解为: x1 = %.4f  x2 = %.4f  x3 = %.4f\n',x(1),x(2),x(3));  % 这里记得根据方程修改个数
fprintf('共迭代%d次\n',count);