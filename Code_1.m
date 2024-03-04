function y = FDM_general(t0,x0,eps,gam,eta,N)
T= 1;
sigma = 1; 
mu = 1; 
var_ep = eps;
best_sigma = sigma + var_ep.*eta;
f = @(z) ((z>0).*var_ep.*gam - (z<=0).*var_ep.*gam).* z;
g = @(x) x.^4; 
h=(T-t0)./N;
t=t0:h:T;
u = mu * h + best_sigma * sqrt(h);
d = mu * h - best_sigma * sqrt(h);
x=x0+d*N +(u-d)*(0:N);
M=(1/2*[full(gallery('tridiag',ones(N-1,1),ones(N,1),zeros(N-1,1)));[zeros(1,N-1),1]]);
L=1/(2*sqrt(h))*([full(gallery('tridiag',ones(N-1,1),-ones(N,1),zeros(N-1,1)));[zeros(1,N-1),1]]);
y=g(x);
for i=N:-1:1 
    x=x(1:i)-d;
    z=y * L(1:i+1,1:i); 
    y=y * M(1:i+1,1:i);
    y=y+h*f(z);
end
end 
