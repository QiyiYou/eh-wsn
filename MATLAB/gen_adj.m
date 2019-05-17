node_adj = zeros(N);
for i = 1:length(link_set)
    node_adj(link_set(i,1),link_set(i,2)) = 1;
end