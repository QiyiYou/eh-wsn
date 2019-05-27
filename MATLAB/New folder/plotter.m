G = digraph(A);
figure
plot(G,'XData',coords(:,1),'YData',coords(:,2))
xlim([0 dimens(1)]);
ylim([0 dimens(2)]);
title(['CC: ' num2str(avg_clust_coeff) ', APL: ' num2str(avg_path_length) ', E: ' num2str(numedges(G))]);