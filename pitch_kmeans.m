% Load Data
train_data = load('train_data.txt');
% Only looking at Pitch Data
data = train_data(:, [16:20]);

% Find mean and std dev
m = mean(data);
s = std(data);

Z = (data - m) ./ s;

% subtract 1 to go from class 1, 2 to binary 0, 1 for parkinsons
k = kmeans(Z, 2) - 1;
y = reshape(k, [26, 40]);
r = mean(y);
o = im2bw(r, 0.5);
p = reshape(o, [20, 2])