node_adj = zeros(N);
for i = 1:N
    node_adj(i,i) = 1;
    if parents(i) ~= 0
        node_adj(i,parents(i)) = 1;
        node_adj(parents(i),i) = 1;
    end
end