function H = hil_mat(n)
%����n��Hilbert����%
H(n,n) = 0;
for i = 1:n
    for j = 1:n
        H(i,j) = 1/(i+j-1);
    end
end
end