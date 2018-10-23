function [Q,R] = qr_hh(A)
[m,n] = size(A);
Q = eye(m);
R(m,n) = 0;
d(n) = 0;
for j = 1:n
    [v,b] = hh(A(j:m,j));
    A(j:m,j:n) = (eye(m-j+1) - b*v*v')*A(j:m,j:n);
    d(j) = b;
    if j < m
        A(j+1:m,j) = v(2:m-j+1);
    end
end
for j = 1:n
    for i = 1:j
        R(i,j) = A(i,j);
    end
    k = n+1-j;
    v = zeros(m+1-k)';
    v(1) = 1;
    v(2:m+1-k) = A(k+1:m,k);
    H_1 = eye(m+1-k) - d(k)*v*v';
    H = eye(m);
    H(k:m,k:m) = H_1;
    Q = H*Q;
end
