function supervisedLearning()

trainingData1 = load('split_data/f1.csv')
[trainedClassifier1, validationAccuracy1] = linearSVM(trainingData1);
data = load('test_data.csv');
counter = 0;
for j=0:55
    if (mod(j, 2) == 0)
        for i=(3*j+1):(3*j+3)
            yfit = trainedClassifier1.predictFcn(data(i, 2:27));
            if (yfit == 1)
                counter = counter + 1;
            end
        end
    end
end
disp('Linear SVM: Number correct out of 84 for sample 1');
disp(counter);

counter = 0;
trainingData2 = load('split_data/f2.csv')
[trainedClassifier2, validationAccuracy2] = linearSVM(trainingData2);
data = load('test_data.csv');
for j=0:55
    if (mod(j, 2) == 1)
        for i=(3*j+1):(3*j+3)
            yfit = trainedClassifier1.predictFcn(data(i, 2:27));
            if (yfit == 1)
                counter = counter + 1;
            end
        end
    end
end
disp('Linear SVM: Number correct out of 84 for sample 2');
disp(counter);

trainingData1 = load('split_data/f1.csv')
[trainedClassifier1, validationAccuracy1] = kNN(trainingData1);
data = load('test_data.csv');
counter = 0;
for j=0:55
    if (mod(j, 2) == 0)
        for i=(3*j+1):(3*j+3)
            yfit = trainedClassifier1.predictFcn(data(i, 2:27));
            if (yfit == 1)
                counter = counter + 1;
            end
        end
    end
end
disp('kNN: Number correct out of 84 for sample 1');
disp(counter);

counter = 0;
trainingData2 = load('split_data/f2.csv')
[trainedClassifier2, validationAccuracy2] = kNN(trainingData2);
data = load('test_data.csv');
for j=0:55
    if (mod(j, 2) == 1)
        for i=(3*j+1):(3*j+3)
            yfit = trainedClassifier1.predictFcn(data(i, 2:27));
            if (yfit == 1)
                counter = counter + 1;
            end
        end
    end
end
disp('kNN: Number correct out of 84 for sample 2');
disp(counter);
    