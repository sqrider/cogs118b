function [sample, percent_error, start_feature, end_feature] = bfr()

% Best using ranges:
% Sample 5, Features 5-12, 25% Error

err = 1.0;
best = -1;
sf = 1;
ef = 26;

num_samples = 26;
min_feature = 1;
max_feature = 26;

% For each sample
for s=1:num_samples
    % For each sample start
    for i=min_feature:(max_feature-2)
        % For each sample end
        for j=(i+1):max_feature
            e = runKMeans(2, strcat('split_data/f', int2str(s), '.csv'), i, j);
            if (e < err)
                err = e;
                best = s;
                sf = i;
                ef = j;
            end
        end
    end
end

sample = best;
percent_error = err;
start_feature = sf;
end_feature = ef;
    