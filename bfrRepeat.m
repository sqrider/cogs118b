function [result, pe, range] = bfrRepeat()
result = 0;
pe = 0;
range = 0;
for i=1:1000
    if (i ~= 10)
        [sample, percent_error, start_feature, end_feature] = bfr();
        result(i) = sample;
        pe(i) = percent_error;
        range(i, 1) = start_feature;
        range(i, 2) = end_feature;
    end
end

