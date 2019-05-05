clear; clc;

% 未知数: 
syms x1 x2;

% 方程组: 统一用列向量
f1 = x1^2 - 10*x1 + x2^2 + 8;
f2 = x1*x2^2 + x1 - 10*x2 + 8;
x = [x1;x2];
f = [f1;f2];

% 初始值: 统一用列向量
x0 = [5;4];
error_sk = double( input('sk范数的精度:') );
error_fkk = double( input('fkk范数的精度:') );
num = input('停止迭代次数:');

% 直接用自带函数求雅克比矩阵:
jacobi = jacobian([f1,f2],[x1,x2]);

% 开始求解前的初值:
Bk = inv( double( subs(jacobi,x,x0) ) );
fk = double( subs(f,x,x0) );

for k = 1:num
    sk = -Bk*fk;
    x0 = x0 + sk;
    fkk = double( subs(f,x,x0) );
    if norm(sk) < error_sk | norm(fkk) < error_fkk 
        break;
    end
    yk = fkk - fk;
    Bkk = Bk + (sk-Bk*yk)*(sk-Bk*yk)'/((sk-Bk*yk)'*yk);
    fk = fkk;
    Bk = Bkk;
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
fprintf('sk范数:%f\n',norm(sk));
fprintf('fkk范数:%f\n',norm(fkk));
