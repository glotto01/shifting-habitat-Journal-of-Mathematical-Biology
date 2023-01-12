function surv=test_d(d,c)
%test wether initial data u=1 for 0<x<d survives if habitat moves at speed
%c. Returns 1 if it survives, 0 if not. Uses survival criteria that distance
%from habitat edge to allee threshold location increses 10 consectutive
%times. Deems extinct if u<allee for all x.

%declarations
global delta k epsilon m1 m0
function y=g(x,u)
        if x<0
            y=m0*u^2/(1+(m1-1)*u^2);
        else
            y=m1*u^2/(1+(m1-1)*u^2);
        end
end
L=size(k,2);
nn=round(d/delta-1/2);
x0=linspace(delta/2,(nn+.5)*delta,nn);
u0=ones(1,nn);
pop1=nn;
count=0;
ext=0;
t=0;
%main loop
while ext==0&&count<50
    %do growth stuff
     g1=arrayfun(@(x,y)g(x,y),x0-c*t,u0);
    u1=conv(k,g1);
    x1=x0(1)-delta*(L-1)/2:delta:x0(end)+delta*(L-1)/2;
    %trim off ends that are less than epsilon
    pl=find(u1>epsilon,1);
    pr=find(u1>epsilon,1,'last');
    %look for obvious extinction
    if isempty(pl)||isempty(pr)
        ext=1;
    else
    x0=x1(pl:pr);
    u0=u1(pl:pr);
    end
    %test if edge to allee distance increased
    pop2=sum(u0);
    if pop2>pop1
        count=count+1;
    else
        count=0;
    end
    pop1=pop2;
    t=t+1;
    %test for extinction
    if max(u0)<1/(m1-1)
        ext=1;
    end
end
if ext==1
    surv=0;
else
    surv=1;
end
end

