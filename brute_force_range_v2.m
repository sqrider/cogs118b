function [sample, percent_error, start_feature, end_feature] = brute_force_range_v2()

% Best using ranges:
% Sample 5, Features 5-12, 25% Error

err = 1.0;
best = -1;
sf = 2;
ef = 27;

num_samples = 26;
min_feature = 5;
max_feature = 22;
% For each sample
for s=1:num_samples
    % For each sample start
    for i=min_feature:max_feature
        % For each sample end
        for j=i:max_feature
            e = km(s, [2:4, i:j, 23:26]);
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
    