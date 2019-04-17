clear ; clc;

% 方程的系数矩阵和右端项
A = [1 2 3 1;1 4 6 2;2 9 8 3;3 7 7 2]
b = [3;2;7;12];

% --------------------对角最大化------------------ %
% 获取系数矩阵的尺寸
[row,col] = size(A);
% 用来记录解x的变化顺序: 这里是原始顺序, 会随着A的调整而调整; 
% 经过调整后再解方程得到的x, 要按照这里调整后的顺序重排才是原方程真正元素对应的解
xx = [1:col]';  % 一共col个未知数(通用)

% 每次行交换时b要跟着变
% 每次列交换时x要跟着变
flag = 1;
while 1
    Atmp = abs(A); % Atmp尺寸不断变小: 因为前面已修改的一行一列不影响后面
    [maxrow,maxcol] = find( Atmp == max(max(Atmp(flag:row,flag:col))) ); % 绝对值最大值坐标
    maxrow = maxrow(end);
    maxcol = maxcol(end);  % 会有多个相同最大值的情况, 统一取最后一个
    % 换行: b一起 
    A([flag maxrow],:) = A([maxrow flag],:);
    b([flag maxrow],1) = b([maxrow flag],1);
    % 换列: x一起
    A(:,[flag maxcol]) = A(:,[maxcol,flag]);
    xx([flag maxcol],1) = xx([maxcol flag],1);
    
    flag = flag + 1;
    if flag > row-1
        break;
    end
end

% --------------------赛德尔迭代------------------ %
D = diag(diag(A));
L = tril(A,-1);     % 向左下移一格的下三角阵;
U = triu(A,1);      % 向右上移一格的上三角阵;
B2 = -inv(D+L)*U;   % 赛德尔迭代矩阵, 用来计算和判断收敛与否;

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
x = zeros(length(b),1);  % 初始迭代4x1的矩阵(列矩阵)
error = double(input('输入迭代精度(例如10^(-4)或0.0001):'));
count = 0;    % 迭代计数器
while 1
    tmp = B2*x + inv(D+L)*b;
    if max(abs(tmp - x)) < error
        break;
    end
    x = tmp;
    count = count + 1;
end

% --------------------最后结果(顺序要调一下)------------------ %
x = x';
x_result = zeros(1,4);
for n = 1:length(x)
    x_result( xx(n) ) = x(n);
end
    
fprintf('方程的解为: x1 = %.4f  x2 = %.4f  x3 = %.4f  x4 = %.4f\n',x_result(1),x_result(2),x_result(3),x_result(4));
fprintf('共迭代%d次\n',count);

