function [x0,u0]=findeq(lpatch,c,tol)
%iterates until max abs diff of respective populations over their respective growth patch is less than tol. Then
%outputs x-nc and u_n vectors to a csv file

%declarations
global delta k m1
hL=(size(k,2)-1)/2;
nn=2*round(lpatch/delta)+1;
u0=ones(1,nn);
diff=10*tol;
%main loop 
while diff>tol
    %compute next generation
    g1=arrayfun(@(x)m1*x^2/(1+(m1-1)*x^2),u0);
    u1=conv(k,g1);
    %find the location of the new "growth patch" , does not pad which may
    %cause errors for very large c (not relevant for parameter regime
    %studied)
    u1=u1(hL+1+round(c/delta):hL+round(c/delta)+nn);
    %test for extinction and compute diff 
    if max(u1)<1/(m1-1)
        diff=0;
        u1=zeros(1,nn);
    else
        diff=max(abs(u1-u0));
    end
    u0=u1;
end
%write full x and u vector
g1=arrayfun(@(x)m1*x^2/(1+(m1-1)*x^2),u0);
u0=conv(k,g1);
m=size(u0,2);
x0=linspace(-lpatch-hL*delta,lpatch+hL*delta,m);
end

