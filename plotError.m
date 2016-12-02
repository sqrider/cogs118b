function plotError(sample, start_feature, end_feature, iters)

errs = zeros(1, iters);
path = strcat('split_data/f', int2str(sample), '.csv');
N = 1040;

for i=1:iters
    errs(i) = runKMeans(2, path, start_feature, end_feature);
end

errs
figure;
[n,x] = hist(errs);
h = bar(x,n, 0.1);
t = strcat('KMeans Err Freq: Sample ', int2str(sample), ', Feats ', int2str(start_feature), ' to ', int2str(end_feature));
title(t);
xticks( (0:0.025:1) );
xlabel('Error');
ylabel('Frequency');
print(strcat('Plot ',int2str(sample)),'-djpeg');