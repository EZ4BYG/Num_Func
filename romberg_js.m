% 龙贝格公式——在加密复化梯形公式的基础上再循环加速(提高精度)!
% 作用: 在加密复化梯形公式基础上, 再提高精度
% 方式: 先全部加密完后, 再依次进行加速——两个过程是"独立"进行的！
% 以f(x) = 4/(1+x^2)函数为例

clear; clc
format long;

syms x;
f = 4/(1+x^2);   % 每次这里修改不同函数即可

up = double(input('输入积分上限:'));
low = double(input('输入积分下限:'));
k = double(input('输入目标对分/加密次数:'));
% 真实定积分的结果: 
R = int(f,x,low,up);  

% 先计算1等分的结果, 后面加密高等分都是基于此推出的！
x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));
Torg = (up - low)/2*(fup+flow);  % 0等分(梯形公式结果)

% 复化梯形加密:
T = zeros(1,k+1);  % 记录每一次加密的结果
T(1) = Torg;       % 把1等分的放到第一个, 方便后面的循环
h = up - low;  % 区间原长
tmp = 1;       % 记录T索引用的
for numk = 0:k
    fmiddle = zeros(1,2^(numk));  
    % 小循环里所有和k有关都是变化的!都和当前numk有关:
    for numi = 1:2^(numk)
        x = low + (2*numi-1)*h/2^(numk+1);
        fmiddle(numi) = double(subs(f));
    end
    T(tmp+1) = 0.5*T(tmp) + h/2^(numk+1)*sum(fmiddle);
    tmp = tmp + 1;
    if tmp == k+1    % 已经满了,可以结束了
        break;
    end
end

% 龙贝格/理查森加速: 用表格/矩阵表示更好编程
Rbg = zeros(k+1,k+1);
Rbg(:,1) = T;  % 第一列初始化(为加速前,即所有的加密点结果)

m = 1;
for col = 2:k+1
    for row = 1:k+1-m
        Rbg(row,col) = ( 4^m * Rbg(row+1,col-1) - Rbg(row,col-1) )/( 4^m-1 );
    end
    m = m + 1;
end

% 加密过程中的一系列结果都在T中, 打印只显示最后精度最高的那个T(k+1):
fprintf('复化梯形加密为%d等分后,当前近似结果为: %.10f\n',2^k,T(k+1));
fprintf('基于当前加密后的龙贝格加速结果为:%.10f\n',Rbg(1,k+1));
fprintf('真实结果为: %.10f\n',R);

    
