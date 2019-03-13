%% Create the link set
linkset = [];
for i = 1:N
    for j = (i+1):N
        if node_adj(i,j) == 1
            linkset = [linkset; [i j]]; % add link (i,j) to link set
        end
    end
end

%% Actual algorithm
K = 1;
Q = {};
while ~isempty(linkset)
    % Remove a link from link set, add it to Q{K}
    Q{K} = linkset(1,:);
    linkset = linkset(2:end,:);
    i = 1;
    while 1
        if i > size(linkset,1)
            break;
        end
        % If no common vertex bw Q{K} and i-th link
        if ~any(Q{K}==linkset(i,:),'all')
            % Add i-th link to Q{K} and remove it from linkset
            Q{K} = [Q{K}; linkset(i,:)];
            linkset = [linkset(1:(i-1),:); linkset((i+1):end,:)];
        else
            i = i+1;
        end
    end
    K = K + 1;
end
initial_schedule = zeros(N);
for k = 1:length(Q)
    for m = 1:size(Q{k},1)
        for n = 1:size(Q{k},1)
            % For any two links in Q{k}, do as given in algorithm
            idx = sub2ind([N N],Q{k}(m,:),Q{k}(n,:));
            initial_schedule(idx) = deal(1);
        end
    end
end
