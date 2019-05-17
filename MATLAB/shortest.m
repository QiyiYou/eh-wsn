distances = ones(N,1).*inf;
parents = zeros(N,1);
distances(N) = 0;
for i = 1:N
    for j = 1:length(link_set)
        a = link_set(j,1);
        b = link_set(j,2);
        if distances(b) > distances(a) + 1
            distances(b) = distances(a) + 1;
            parents(b) = a;
        end
    end
end