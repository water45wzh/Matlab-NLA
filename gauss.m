function [L,U] = gauss(A)
n = size(A,1);
L(n,n) = 0;
U(n,n) = 0;
for k = 1:n-1
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
end
for k = 1:n
    L(k,k) = 1;
end
for i = 2:n
    for j = 1:i-1
       L(i,j) = A(i,j);
    end
end
for j = 1:n
    for i = 1:j
        U(i,j) = A(i,j);
    end
end
end
    