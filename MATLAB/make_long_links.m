hop_threshold = 3;
node_adj_long_links = zeros(N);
for i = 1:N
    node_adj_long_links(i,i) = 1;
    if distances(i) > hop_threshold
        node_adj(i,parents(i)) = 0;
        node_adj(parents(i),i) = 0;
        node_adj(i,N) = 1;
        node_adj(N,i) = 1;
        node_adj_long_links(i,N) = 1;
        node_adj_long_links(N,i) = 1;
        distances(i) = 1;
    end
end