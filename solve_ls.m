function x = solve_ls(A,b)
%����QR�ֽ������С��������
C = A'*A;
d = A'*b;
[Q,R] = qr_hh(C);
x = solve_up(R,Q'*d);
end

