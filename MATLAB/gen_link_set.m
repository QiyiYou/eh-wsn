tx_threshold = sqrt(1.5^2+.75^2);
link_set = [];
for i = 1:N
    for j = 1:N
        if norm(node_coords(i,:)-node_coords(j,:)) < tx_threshold
            link_set = [link_set; i j];
        end
    end
end