gplot(node_adj,node_coords);
hold on;
for i = 1:N
    text(node_coords(i,1),node_coords(i,2),num2str(distances(i)));
end