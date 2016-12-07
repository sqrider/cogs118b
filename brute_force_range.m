function [sample, percent_error, start_feature, end_feature] = brute_force_range(preprocessing)

if (strcmp(preprocessing, 'pca') == 0) 
    preprocessing = 'z';
end

% Best using ranges:
% Sample 5, Features 5-12, 25% Error

err = 1.0;
best = -1;
sf = 2;
ef = 27;

num_samples = 26;
min_feature = 2;
max_feature = 27;

% For each sample
for s=1:2
    % For each sample start
    for i=min_feature:max_feature
        % For each sample end
        for j=i:max_feature
            if (strcmp(preprocessing, 'pca') == 1)
                e = km_pca(s, [i:j]);
            else
                e = km(s, [i:j]);
            end
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
    