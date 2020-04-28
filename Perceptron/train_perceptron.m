function [w,b] = train_perceptron(X, y)
    %{
    Input Parameters:
    X --> Training Data in the shape of N*D where N is the no of samples of
    the data and D is the no of dimensions of the data
    y --> Training Labels in the shape of N*1 where N is the no of samples
    of training data
    
    Output Parameters:
    w --> set of weights of the dimension D*1 where D is the no of
    dimensions of the data
    b --> value of bias
    %}

    %Check for vaiable traing
    if nargin < 2
        error('Incorrect number of input arguments')
    end
    
    if size(X,1) ~= size(y,1)
        error('Training Data and Label size mismatch')
    end
    
    %Initializtion
    [N,d] = size(X);
    X_tilda = [ones(N,1) X];
    w_tilda = zeros(d+1,1);
    
    %Training Process
    for i = 1:N
        if y(i)*(X_tilda(i,:)*w_tilda)<=0
            w_tilda = w_tilda + y(i)*X_tilda(i,:)';
        end
    end
    b = w_tilda(1);
    w = w_tilda(2:end);
end
