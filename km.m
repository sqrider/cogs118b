function km(sample, feature_start, feature_end)
% Runs K-Means with Z-Scoring for a specific sample
% using only the specified features
% 1 <= sample <= 26
% min feature = 2
% max feature = 27

% Constrain Input
sample = max(1, sample);
sample = min(26, sample);
feature_start = max(2, feature_start);
feature_end = min(27, feature_end);

% Load Data
path = strcat('split_data/f', int2str(sample), '.csv');
train_data = load(path);
% Only looking at Pitch Data
data = train_data(:, [feature_start:feature_end]);

% Find mean and std dev
m = mean(data);
s = std(data);

Z = (data - m) ./ s;

% Print 
fprintf('Running KMeans on Sample %d with features %d to %d', sample, feature_start, feature_end); 

% subtract 1 to go from class 1, 2 to binary 0, 1 for parkinsons
k = (kmeans(Z, 2) - 1)';
o = reshape(k, [20, 2])