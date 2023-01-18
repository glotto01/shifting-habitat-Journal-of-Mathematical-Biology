function  lstar(tol,nn)
tic
%divides [0,.99cstar] into nn sample points,uses bisection to find lstar to accuracy tol, then writes c and lstar vector to a csv
setglobal(.0001,5,15);
c=linspace(0,.99*cstar(),nn);
lstar=zeros(1,nn);
%loop over c
for s=1:nn
    lleft=.7;
    lright=3.6;
    %do bisection
    while lright-lleft>tol
        lmid=(lright+lleft)/2;
        [~,u0]=findeq(lmid,c(s),tol);
        p=max(u0);
        if p>0
            lright=lmid;
        else
            lleft=lmid;
        end
    end
    lstar(s)=(lright+lleft)/2;
end
csvwrite('lstar.csv',[c;lstar]);
toc
end

