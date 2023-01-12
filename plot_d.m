function plot_d(tol,nn)
tic
% divides [0,.99cstar] into nn sample points,uses bisection to find dstar to accuracy tol, then writes c and dstar vector to a csv
setglobal(.0001,5,15);
c=linspace(0,.99*cstar(),nn);
dstar=zeros(1,nn);
%loop over c
for p=1:nn
    left=0.4;
    right=4;
    %bisection
    while right-left>tol
        mid=(right+left)/2;
        result=test_d(mid,c(p));
        if result==1
            right=mid;
        else
            left=mid;
        end
    end
    dstar(p)=(right+left)/2;
end
csvwrite('dstar.csv',[c;dstar]);
toc
end

