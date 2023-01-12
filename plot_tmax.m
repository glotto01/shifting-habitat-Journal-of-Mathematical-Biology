function plot_tmax(d,c,tmax,file)
% plot the population density curves from t=0 to t=tmax. initial condition
% is u=1 from x=0 to d.

%declarations
global delta k epsilon m1 m0
data=cell(1,tmax+1);
L=size(k,2);
%declare the growth function
    function y=g(x,u)
        if x<0
            y=m0*u^2/(1+(m1-1)*u^2);
        else
            y=m1*u^2/(1+(m1-1)*u^2);
        end
    end
%declare x0 and u0
nn=round(d/delta-1/2);
x0=linspace(delta/2,(nn+.5)*delta,nn);
u0=ones(1,nn);
data{1}=[x0;u0];
%main loop for t
for t=1:tmax
    g1=arrayfun(@(x,y)g(x,y),x0-c*(t-1),u0);
    u1=conv(k,g1);
    x1=x0(1)-delta*(L-1)/2:delta:x0(end)+delta*(L-1)/2;
    %trim off ends that are less than epsilon
    pl=find(u1>epsilon,1);
    pr=find(u1>epsilon,1,'last');
    %look for extinction
    if isempty(pl)||isempty(pr)
        x0=0;
        u0=0;
    else
    x0=x1(pl:pr);
    u0=u1(pl:pr);
    end
    data{t+1}=[x0;u0];
end
plot(x0,u0);
%store results in csv file
%find longest vector
long=0;
for j=1:tmax+1
   s=size(data{j},2);
   if s>long
       long=s;
   end
end
%pad with NaN
data2=zeros(2*(tmax+1),long);
for j=1:tmax+1
   s=long-size(data{j},2);
  Z=[data{j} NaN(2,s)];
  data2(2*j-1:2*j,:)=Z;
end
csvwrite(file,data2);
end

