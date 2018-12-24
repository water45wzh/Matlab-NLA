function A = J(n,p,q,c,s)
A = eye(n);
A(p,p) = c;
A(q,q) = c;
A(p,q) = s;
A(q,p) = -s;
end