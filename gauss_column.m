function [L,U,P]=gauss_column(A)
    n=size(A,1);
    U=A;P=eye(n);L=eye(n);
    for i=1:n
        for j=i:n
            t(j)=U(j,i);
            t(j)=t(j)-U(j,1:i-1)*U(1:i-1,i);
        end
        a=i;b=abs(t(i));
        for j=i+1:n
            if b<abs(t(j))
                b=abs(t(j));
                a=j;
            end
        end
        if a~=i
            for j=1:n
                c=U(i,j);
                U(i,j)=U(a,j);
                U(a,j)=c;
            end
            for j=1:n
                c=P(i,j);
                P(i,j)=P(a,j);
                P(a,j)=c;
            end
            c=t(a);
            t(a)=t(i);
            t(i)=c;
        end
        U(i,i)=t(i);
        for j=i+1:n
            U(j,i)=t(j)/t(i);
        end
        for j=i+1:n
            U(i,j)=U(i,j)-U(i,1:i-1)*U(1:i-1,j);
        end
    end
    L=tril(U,-1)+eye(n);
    U=triu(U,0);
end
