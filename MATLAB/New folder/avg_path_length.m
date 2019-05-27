function apl = avg_path_length()
global N A;
dists = distances(digraph(A));
dists(dists==Inf) = 0;
apl = sum(dists,'all')/(N*(N-1));
