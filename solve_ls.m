function x = solve_ls(A,b)
%利用QR分解求解最小二乘问题
C = A'*A;
d = A'*b;
[Q,R] = qr_hh(C);
x = solve_up(R,Q'*d);
end

