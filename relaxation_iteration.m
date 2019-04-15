% 线性方程组近似求解: 松弛迭代
% 思路: 在赛德尔迭代的基础上, 再加一个松弛因子w来调控收敛速度;
% 说明: 松弛迭代可能加速也可能降速! 并且可能原来赛德尔收敛, 但是加了w后就发散了。
% 注意: w一般在[0,2]之间, w=1就是赛德尔迭代, w>1一般加速, 0<w<1一般减速。

clear; clc;

% 关于原方程组的迭代计算必备矩阵: 不同方程每次修改A和b即可。
A = [10 -1 2 0;-1 11 -1 3;2 -1 10 -1;0 3 -1 8];  % 系数矩阵
b = [7;14;-10;12];          % 等号右边结果(列矩阵)
D = diag(diag(A));
L = tril(A,-1);    % 向左下移一格的下三角阵;
U = triu(A,1);     % 向右上移一格的上三角阵;
w = double(input('输入松弛因子w(一般0~2):'));
B3 = inv(D+w*L) * ( (1-w)*D - w*U );   % 雅克比迭代矩阵, 用来计算和判断收敛与否;

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