function plotError(sample, start_feature, end_feature, iters)

errs = zeros(1, 299000);
path = strcat('split_data/f', int2str(sample), '.csv');
% path = 'ptest.csv';
N = 1040;
counter = 1;
for k=1:iters
        for i=2:(26-2)
        % For each sample end
            for j=(i+1):26
%                 errs(k) = runKMeans(2, path, i, j);
                errs(counter) = km(sample, [i:j]);
                counter = counter + 1;
            end
        end
%     disp(k);
end
% disp(counter);
figure;
[n,x] = hist(errs);
h = bar(x,n, 0.1);
t = strcat('KMeans Err Freq: Brute Force');
title(t);
xticks( (0:0.025:1) );
xlabel('Error');
ylabel('Frequency');
print(strcat('Plot ',int2str(sample)),'-djpeg');
