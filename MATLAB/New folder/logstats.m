function logstats()
global CC APL E A;
G = digraph(A);
CC = [CC; avg_clust_coeff];
APL = [APL; avg_path_length];
E = [E; numedges(G)];
disp(['CC: ' num2str(CC(end)) ', APL: ' num2str(APL(end)) ', E: ' num2str(E(end))]);