x = zeros(1,11);
ep_arr = zeros(1,11);
i=0;
for ep = 0.00:0.01:0.1
   i = i+1;
   x(i) = FDM_general(0,0,ep,1,1,1000);
   ep_arr(i) = ep;
   disp(x(i));
end
