clear all; close all; clc

load adult_train_test

for k=1:10
    %shuffle training set
    idx=randperm(numel(ytrain));
    Xtrain=Xtrain(idx,:);
    ytrain=ytrain(idx);
    
    % train percetron (1 pass over training set)
    [w,b]=train_perceptron(Xtrain,ytrain);
    
    %test
    test_err_last_array(k)=numel(find(ytest~=sign(Xtest*w+b)))/numel(ytest);
end

test_err_last_array
