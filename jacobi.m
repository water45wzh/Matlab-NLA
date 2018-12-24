function [c,s,t] = jacobi(a,b,g)
if b ~= 0
    r = (g-a)/(2*b);
    if r >= 0
        t = 1/(r+sqrt(1+r^2));
    else
        t = -1/(-r+sqrt(1+r^2));
    end
    c = 1/sqrt(1+t^2);
    s = t*c;
else
    c = 1;
    s = 0;
    t=0;
end
end