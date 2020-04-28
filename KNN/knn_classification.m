function [predicted_labels] = knn_classification(k,data_train, labels_train, data_test)    
    %Checks for vaiable classification task
    if nargin < 4
        error('Incorrect number of input arguments')
    end
    
    if size(data_train,2) ~= size(data_test,2)
        error('DImensions of Training and Testing Data Does Not Match')
    end
    
    if k == 0
        error('Value of k cannot be zero')
    end
    
    if k >= size(data_train,1)
        error('k cannot be larger than no of training samples')
    end
    
    %initialization
    predicted_labels = zeros(size(data_test, 1), 1);
    
    for test_point = 1:size(data_test,1)
        distances = sqrt(sum((repmat(data_test(test_point,:),size(data_train,1),1) - data_train).^2,2));
            [~, index] = sort(distances);
        index = index(1:k);
        labels = labels_train(index);
        predicted_labels(test_point) = mode(labels);
    end
end

