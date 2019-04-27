% 满秩分解: A = FG
% 其中A是m*n, 秩为r; 则F是m*r, 秩为r; G是r*n, 秩也为r
% 满秩分解不是唯一的！但是一般得用下面的这种方法

clear ; clc;

A = [1 5 1 3;1 2 -1 2;-1 -2 -2 1];
r = rank(A);         % 记录A的秩数r 
[row,col] = size(A); % 记录A的尺寸

H = rref(A);    % A的行最简形式H
G = H(1:r,:);   % 取行最简形式前面r行

col_list = [];  % 记录行最简形式中各个主元1对应的列号
num = 1;        % 一个计数器
for m = 1:row
    for n = m:col
        if H(m,n) == 1
            col_list(num) = n;
            num = num + 1;
            break;
        end
    end
end
F = A(:,col_list);  % 上面记录的列号所对应的A中的那些列

% 判断满秩分解后再重组是否和原来的一样: 1是一样, 0是不一样
isequal(A,F*G)
        

