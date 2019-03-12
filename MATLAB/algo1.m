%% Create the link set
linkset = [];
for i = 1:N
    for j = (i+1):N
        if node_adj(i,j) == 1
            linkset = [linkset; [i j]]; % add link (i,j) to link set
        end
    end
end

%% Create conflict graph
% Do we need to?

%% Actual algorithm
K = 1;
while ~isempty(linkset)
    % Remove a link from link set, add it to Q_k
    Q_k = linkset(1,:);
    linkset = linkset(2:end,:);
    for i = 1:length(linkset)
        % TO DO: lines 6-8. Here l_pq is linkset(i,:).
    end
    K = K + 1;
end

% TO DO: Rest of the algorithm (lines 12-17)
