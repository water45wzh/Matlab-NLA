function m = estfornorminf(A)
%估计逆矩阵的无穷范数%
n = size(A,1);
x(n) = 0;
for i = 1:n
    x(i) = 1/n;
end
x = x';
k = 1;
pd = -1;%一个判定变量%
while k == 1
    [L_1,U_1] = gauss(A');
    [L_2,U_2] = gauss(A);
    y_1 = solve_low(L_1,x);
    w = solve_up(U_1,y_1);
    v = sign(w);
    y_2 = solve_low(L_2,v);
    z = solve_up(U_2,y_2);
    if norm(z,inf) <= z'*x
        m = norm(w,1);
        k=0;
    else
        [l,j] = max(z);
        if j == pd
            m = norm(w,1);
            break%由于采用这个方法会使一些矩阵陷入死循环，故在此选择跳出循环直接输出%
        end
        x = x - x;
        x(j) = 1;
        k = 1;
        pd = j;
    end
end
end