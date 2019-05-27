%% Init
global CC APL E;
CC = [];
APL = [];
E = [];

%% Load node coordinates
global N dimens coords A;
N = 1000;
dimens = [1000 1000];
coords = rand(N,2)*1000;
[~, sort_order] = sort(vecnorm(coords,2,2),'descend');
coords = coords(sort_order,:);
A = zeros(N);

%% Initialize links

% Distance threshold
normal_threshold = 60;
for i1 = 1:N
    for i2 = 1:N
        if norm(coords(i2,:)-coords(i1,:)) <= normal_threshold && i1 ~= i2
            A(i1,i2) = 1;
        end
    end
end

% Nearest neighbours
% for i = 1:N
%     [~, nearests] = sort(vecnorm(coords-coords(i,:),2,2));
%     for j = nearests(2:4)
%         A(i,j) = 1;
%     end
% end

% Random
% A = randi([0 1],N);
% for i = 1:N
%     A(i,i) = 0;
% end

% Remove links beyond threshold distance
% normal_threshold = sqrt(0.2^2+0.2^2)*norm(dimens);
% for i1 = 1:N
%     for i2 = 1:N
%         if norm(coords(i2,:)-coords(i1,:)) >= normal_threshold
%             A(i1,i2) = 0;
%         end
%     end
% end

disp('ORIGINAL NETWORK:');
logstats;

%% Make long links
% long_link_threshold = sqrt(0.5^2+0.5^2)*norm(dimens);
disp('ITERATIONS:');
n_per_iter = 5;
for n_iter = 1:60
    cc = [];
    for i = 1:N
        cc = [cc; clust_coeff(i)];
    end
    [~, cc_order] = sort(cc,'descend');
    A(cc_order(1:n_per_iter),cc_order(1:n_per_iter)) = 1;
    for i = 1:N
        A(i,i) = 0;
    end
    
    % for i = 1:round(N/10)
    %     A(cc_order(i+1),cc_order(i)) = 1;
    % end
    %
    
    logstats;
end

ccapl