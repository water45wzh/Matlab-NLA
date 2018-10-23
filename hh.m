function [v,b] = hh(x)
n = length(x);
v(n) = 0;
l = norm(x,inf);
x = x/l;
if n == 1 %考虑QR分解中矩阵为方阵的情形%
    s = 0;
else
    s = x(2:n)'*x(2:n);
    v = v';
    v(1) = 1;
    v(2:n) = x(2:n);
end
if s == 0
    b = 0;
else
    a = sqrt(x(1)^2 + s);
    if x(1) <= 0
        v(1) = x(1) - a;
    else
        v(1) = -s/(x(1) + a);
    end
    b = 2*v(1)^2/(s+v(1)^2);
    v = v/v(1);
end
end