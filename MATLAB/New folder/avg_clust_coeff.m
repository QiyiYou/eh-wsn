function cc_avg = avg_clust_coeff()
global N;
cc_tot = 0;
for i = 1:N
    cc_tot = cc_tot + clust_coeff(i);
end
cc_avg = cc_tot/N;
