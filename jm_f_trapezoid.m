% 复化梯形公式加密
% 作用: 快速计算"等分"后再在"每个小份不断对分"的加速算法! 就是为了加速计算的
% 方式: 知道1等分后, 用加密方法可以快速计算任意2^k等分的结果
% 以f(x) = 4/(1+x^2)函数为例

clear; clc

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

% 加密过程中的一系列结果都在T中, 打印只显示最后精度最高的那个T(k+1):
fprintf('复化梯形加密为%d等分后,当前近似结果为: %.7f\n',2^k,T(k+1));
fprintf('真实结果为: %.10f\n',R);

    
