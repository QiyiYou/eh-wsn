tx_threshold = sqrt(1.5^2+.75^2);
weights = ones(N);
for i = 1:N
    for j = 1:N
        if norm(node_coords(i,:)-node_coords(j,:)) > tx_threshold
            weights(i,j) = inf;
        end
    end
end