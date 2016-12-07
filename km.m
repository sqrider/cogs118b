function err = km(sample, features)
% Runs K-Means with Z-Scoring for a specific sample
% using only the specified features
% 1 <= sample <= 26
% feature is an array of features, assumed to be sorted and distinct, [2-27]

% Constrain Input
sample = max(1, sample);
sample = min(26, sample);

% Load Data
path = strcat('split_data/f', int2str(sample), '.csv');
train_data = load(path);
% Only looking at Pitch Data
data = train_data(:, features);

% Find mean and std dev
m = mean(data);
s = std(data);

Z = (data - m) ./ s;

% Print 
%fprintf('Running KMeans on Sample %d with features %d to %d', sample, feature_start, feature_end); 

% subtract 1 to go from class 1, 2 to binary 0, 1 for parkinsons
k = (kmeans(Z, 2) - 1)';
o = reshape(k, [20, 2]);
print(o);
print(k);

% calculate the number wrong, knowing that kmeans does not guarantee 
% parkinsons = 0 or 1, so try both and take the min
w1 = abs(sum(o(:,1) - 1)) + abs(sum(o(:,2)));
w2 = abs(sum(o(:,1))) + abs(sum(o(:,2) - 1));
wrong = min(w1, w2);
err = wrong / 40;