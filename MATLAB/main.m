%% Randomly initialize node coordinates and links
create_nodes;
figure;
gplot(node_adj,node_coords,'b');
title('Randomly initialized links');

%% Use algorithm 1 to find optimal initial schedule
algo1;
figure;
gplot(initial_schedule,node_coords,'r');
title('Optimal initial schedule (Algorithm 1)');
