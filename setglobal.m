function setglobal(eps,msmall,mbig)
%this function globally sets the value of delta, and the dispersal vector
global delta k epsilon m1 m0
epsilon=eps;
m0=msmall;
m1=mbig;
delta=sqrt(24*eps/(2*mbig+1.95*mbig/sqrt(mbig-1)));
L=-log(eps);
N=round(L/delta);
k1=arrayfun(@(x)0.5*exp(-x*delta)*(exp(delta/2)-exp(-delta/2)),1:N);
k=[flip(k1) (1-exp(-delta/2)) k1];
k=k/sum(k);
end

