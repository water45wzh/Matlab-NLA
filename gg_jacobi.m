function [r,V] = gg_jacobi(A)
n = size(A,1);
V = eye(n);
r(n) = 0;
r = r';
delta = norm(A,'fro')^2;
eps = 1e-14;
for j = 1:n
    delta = delta - A(j,j)^2;
end
delta = sqrt(delta);
while delta >= eps
    pd = 1;%判定对角元是否均比delta小的记录数据s
    for p = 1:n-1
        for q = p+1:n
            if abs(A(p,q)) >= delta
                [c,s,t] = jacobi(A(p,p),A(p,q),A(q,q));
                A = J(n,p,q,c,s)'*A*J(n,p,q,c,s);
                V = V*J(n,p,q,c,s);
                pd = 0;
            end
        end
    end
    if pd == 1
        delta = delta/n;
    end
end
for i = 1:n
    r(i) =A(i,i);
end
