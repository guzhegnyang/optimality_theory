%frac23_method.m
function [a, sampling] = frac23_method(f, x, d, am, km)
    %f 目标函数
    %x 当前解
    %d 当前方向
    %am 当前步长最大取值
    %km 最大迭代次数
    c = 2/3;                %常数0.666
    k = 1;                  %第k次迭代
    a = zeros(1, km);       %记录计算当前步长随迭代次数变化的所有取值
    sampling = zeros(1, km);%记录采样数随迭代次数变化的所有取值
    a0 = 0;                 %区间左边界
    a1 = am - c * am;       %待比较点较小值
    a2 = c * am;            %待比较点较大值
    a3 = am;                %区间右边界
    f1 = f(x + a1 * d);
    f2 = f(x + a2 * d);
    sampling(1, k) = 2;

    while k <= km - 1
        if f1 >= f2
            a0 = a1;
            a1 = a3 - c * (a3 - a0);
            a2 = c * (a3 - a0) + a0;
            a(1, k) = f2;
            k = k + 1;
            f1 = f(x + a1 * d);
            f2 = f(x + a2 * d);
            sampling(1, k) = sampling(1, k - 1) + 2;
        else
            a3 = a2;
            a2 = c * (a3 - a0) + a0;
            a1 = a3 - c * (a3 - a0);
            a(1, k) = f1;
            k = k + 1;
            f2 = f(x + a2 * d);
            f1 = f(x + a1 * d);
            sampling(1, k) = sampling(1, k - 1) + 2;
        end
    end

    if f1 >= f2
        a(1, k) = f2;
    else
        a(1, k) = f1;
    end
end
