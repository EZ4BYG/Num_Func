clear; clc;
format short;

% 无穷解:
A = [1 -1 -1 4;1 -1 1 -3;1 -1 -2 3];
b = [0;1;-0.5];

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

% 广义加号逆: 
Aplus = G'*inv(G*G')*inv(F'*F)*F';
[row_Aplus, col_Aplus] = size(Aplus);  % 后面I需要Aplus的行数

% 通解: 先创建和未知数个数一样的变量y
y = sym(zeros(col,1));
for m = 1:col
    y(m) = ['x' num2str(m)]; 
end 
x = Aplus*b + ( eye(row_Aplus) - Aplus*A )*y;

% 唯一极小范数解: 
x0 = Aplus*b;


