clear ; clc

% 未知数: 
syms x1 x2;

% 方程组: 统一用列向量
f1 = x1^2 - 10*x1 + x2^2 + 8;
f2 = x1*x2^2 + x1 - 10*x2 + 8;
% f1 = 4*x1 - x2 + 0.1*exp(x1)-1;
% f2 = -x1 + 4*x2 + 1/8*x1^2;
x = [x1;x2];
f = [f1;f2];

% 初始值: 统一用列向量
x0 = [1;2];
error_dxk = double( input('dxk范数的精度:') );
error_fkk = double( input('fkk范数的精度:') );
num = input('停止迭代次数:');

% jacobi1 = [diff(f1,x1) diff(f1,x2);diff(f2,x1) diff(f2,x2)]
% 直接用自带函数求雅克比矩阵:
jacobi = jacobian([f1,f2],[x1,x2]);

for k = 1:num
    Ak = double( subs(jacobi, x, x0) );
    bk = double( subs(f, x, x0) );
    dxk = pre_seidel(Ak,-bk,k);  % 步长
    x0 = x0 + dxk;
    fkk = double( subs(f, x, x0) );  % 单纯用来判断
    if norm(dxk) < error_dxk | norm(fkk) < error_fkk
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
fprintf('dxk范数:%f\n',norm(dxk));
fprintf('fkk范数:%f\n',norm(fkk));
    
    


