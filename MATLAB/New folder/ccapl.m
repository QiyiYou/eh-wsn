figure;
yyaxis left;
plot(1:length(CC),CC);
ylim([0 1]);
yyaxis right;
plot(1:length(APL),APL);
ylim([0 max(APL)]);
legend('Clustering coeff','Avg path length');
grid on;