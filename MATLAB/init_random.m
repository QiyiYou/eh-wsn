A = randi([0 1],N);
for i = 1:N
    A(i,i) = 0;
end
G = digraph(A,node_coords);