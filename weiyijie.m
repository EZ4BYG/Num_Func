clear; clc;
format short;

% 唯一解:
A = [5 2 0;-1 4 2;2 -3 10];
b = [3;-3;15];

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

% 唯一解: 
x0 = Aplus*b;


