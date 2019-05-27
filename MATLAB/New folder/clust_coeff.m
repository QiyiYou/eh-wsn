function C = clust_coeff(i)
global A N;
% Find neighbours of node i
neighbours = [];
for j = 1:N
    if (A(i,j) == 1 || A(j,i) == 1) && i ~= j && ~ismember(j,neighbours)
        neighbours = [neighbours j];
    end
end
% Find number of edges among neighbours
cnt = 0;
for j = neighbours
    for k = neighbours
        if A(j,k) == 1
            cnt = cnt + 1;
        end
    end
end
% Return clustering coefficient
k = length(neighbours);
if k <= 1
    C = 0;
else
    C = cnt/(k*(k-1));
end