clear ; clc;

% 未知数: 
syms x1 x2;

% 方程组: 统一用列向量
f1 = x1^2 - 10*x1 + x2^2 + 8;
f2 = x1*x2^2 + x1 - 10*x2 + 8;
x = [x1;x2];
f = [f1;f2];

% 初始值: 统一用列向量
x0 = [5;4];
error_z = double( input('z范数的精度:') );
error_fk = double( input('fk范数的精度:') );
num = input('停止迭代次数:');

% 直接用自带函数求雅克比矩阵:
jacobi = jacobian([f1,f2],[x1,x2]);

% 小循环m取多少的判断: 和方程个数N有关,求w的最大值
syms M N;
mn0 = [N;M];
% 参数xzn是方程的个数:
xzn = length(x);  
% 原始的效率对比方程:
w = (N+1)*log(M+1)/( (N+M)*log(2) ); 
% 让w方程求最大值的xzm值:
xzm = double( solve( diff( subs(w,N,xzn),M ) ) );
mn1 = [xzn;xzm];
% 最高效率值:
wax = double( subs(w,mn0,mn1) );

% 开始修正牛顿迭代:
xki = x0;
for k = 1:num
    fk = double( subs(f,x,x0) );
    Ak = inv( double( subs(jacobi, x, x0) ) );
    for m = 1:round(xzm)
        b = fk;
        x0 = x0 - Ak*b;
        fki = double( subs(f,x,x0) );
        fk = fki;
        z = Ak*b;    
    end
    if norm(z) < error_z | norm(fk) < error_fk
        break;
    end
end

if k < num
    x_result = x0;
    fprintf('精度已达要求，迭代提前结束!\n');
    fprintf('%d次迭代后, 近似解为:\n',k);
    x_result
else
    x_result = x0;
    fprintf('迭代次数已达上限!\n');
    fprintf('似解为:\n',k);
    x_result
end

fprintf('f1结果为:%f\n',double( subs(f1,x,x0) ));
fprintf('f2结果为:%f\n',double( subs(f2,x,x0) ));
fprintf('z范数:%f\n',norm(z));
fprintf('fk范数:%f\n',norm(fk));