function [sample, percent_error, best_features] = brute_force()

% Best using ranges:
% Sample 5, Features 5-12, 25% Error

err = 1.0;
best = -1;
f = [];

features = [2:27];

num_samples = 26;
num_features = 26;

% For each sample
for s=1:num_samples
    fprintf('Sample %d\n', s);
    % For each combination of features
    for i=1:num_features
        set = combnk(1:num_features, i);
        for j=1:size(set)
            nums = features(set(j,:));
            e = km(s, nums);
            if (e < err)
                err = e;
                best = s;
                f = nums;
            end
        end
    end
end

sample = best;
percent_error = err;
best_features = f;
    