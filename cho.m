function L = cho(A)
n = size(A,1);
L(n,n) = 0;
for k = 1:n
    A(k,k) = sqrt(A(k,k));
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    for j = k+1:n
        A(j:n,j) = A(j:n,j) - A(j:n,k)*A(j,k);
    end
end
for k = 1:n
    L(k:n,k) = A(k:n,k);
end
end
