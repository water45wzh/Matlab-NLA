function [L,D] = n_cho(A)
n = size(A,1);
L(n,n) = 0;
D(n,n) = 0;
v(n) = 0;
v = v';
for j = 1:n
    for i = 1:j-1
        v(i) = A(j,i)*A(i,i);
    end
    A(j,j) = A(j,j) - A(j,1:j-1)*v(1:j-1);
    A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n,1:j-1)*v(1:j-1))/A(j,j);
end
for k = 1:n-1
    L(k+1:n,k) = A(k+1:n,k);
end
for k = 1:n
    L(k,k) = 1;
    D(k,k) = A(k,k);
end
end
