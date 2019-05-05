% 线性方程组预处理后的"万能收敛"高斯-赛德尔迭代法
% 无视各种问题，只要有解，一定能解出。

function [x] = pre_seidel(A,b,n)

% 预处理: 就是这么简单 
b = A'*b;
A = A'*A;
% 下面是正常的高斯-赛德尔操作: 
D = diag(diag(A));
L = tril(A,-1);     % 向左下移一格的下三角阵;
U = triu(A,1);      % 向右上移一格的上三角阵;
B2 = -inv(D+L)*U;   % 赛德尔迭代矩阵, 用来计算和判断收敛与否;
g2 = inv(D+L)*b;

radius = max(abs(eig(B2)));  % 特征值有可能为复数, abs取绝对值 + 取模
fprintf('第%d次求解线性方程组, 当前万能赛德尔迭代矩阵谱半径为(越小越好): %.4f\n',n,radius);
    
% 迭代计算部分:
x = zeros(length(b),1);  % 初始迭代4x1的矩阵(列矩阵): 初始值全为0
error = 0.0001; % 统一用一个精度即可,可修改
count = 0;      % 迭代计数器
while 1
    tmp = B2*x + g2;
    if max(abs(tmp - x)) < error
        break;
    end
    x = tmp;
    count = count + 1;
end

