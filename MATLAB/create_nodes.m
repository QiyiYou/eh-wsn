%% Randomly create nodes
N = 20; % number of nodes
arena_dimen = [6 6]; % Dimensions of rectangular arena
node_coords = rand(N,2).*arena_dimen; % Randomly scatter N nodes in arena

%% Generate N*N symmetric node adjacency matrix
A = randi([0 1],N);
node_adj = triu(A,1) + tril(A,-1) + eye(N);
