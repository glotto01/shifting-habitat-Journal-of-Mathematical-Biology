function c = cstar()
tic
%find cstar(infinity)
global k delta epsilon m1
%declarations
L=size(k,2);
uones=ones(1,L);
%main while loop
u00=uones;
plavg1=0;
plavg2=10;
while abs(plavg1-plavg2)>.5
    plavg1=plavg2;
    plavg2=0;
for i=1:10
    %forward map
    g1=arrayfun(@(x)m1*x^2/(1+(m1-1)*x^2),u00);
    u1=conv(k,g1);
    %find position of right point exceeding threshold
    pr=find(u1>epsilon,1,'last');
    pl=find(u1>1-epsilon,1,'last');
    plavg2=plavg2+pl;
  u00=[uones u1(pl:pr)];
end
plavg2=plavg2/10;
end
c=delta*(plavg2-3/2*L-3/2);
toc
end

