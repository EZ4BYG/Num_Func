clear ; clc;

% 每次修改这里的方程相关参数:
A = [1 2 4;2 1 1;1 1 2;1 -1 -2];
b = [-1;4;2;1];

zg = [A,b];  % 增广矩阵: 就是判断用的
if rank(zg) > rank(A)
    fprintf('超定不相容!\n');
else
    return ;
end

fprintf('最小二乘近似求解开始:\n');
% 方程求解 + 总体误差求解: 
x = inv(A'*A)*A'*b; 
error = (b(1) - sum(A(1,:).*x'))^2 + (b(2) - sum(A(2,:).*x'))^2 + (b(3) - sum(A(3,:).*x'))^2; 

fprintf('方程近似解为: x1 = %.4f  x2 = %.4f  x3 = %.4f\n', x(1),x(2),x(3));
fprintf('方程总体(最小)误差为: error = %.4f\n',error);