function [alpha, DTCell, tr_err] = train_boosted_dt(Xtr, ytr, T)
    [no_of_samples, ~] = size(Xtr);
    D = ones(no_of_samples,1)/no_of_samples;
    DTCell = cell(1,T);
    tr_err = zeros(1,T);
    alpha = [];
    for t = 1:T
        tree = fitctree(Xtr,ytr,'Weights',D,'MaxNumSplits',3);
        DTCell{t} = tree;
        y_training_predict = predict(tree,Xtr);
        %error = 0;
        epsilon_t = 0;
        for i = 1:length(y_training_predict)
            if y_training_predict(i) ~= ytr(i)
                epsilon_t = epsilon_t + D(i);
            end
        end
        alpha_t = 0.5*log((1/epsilon_t) - 1);
        D = D.*(exp(-alpha_t*(y_training_predict.*ytr)));
        D = D/sum(D);
        alpha = [alpha alpha_t];
        [ypred] = test_boosted_dt(Xtr, alpha(1:t), DTCell(1:t));
        tr_err(t) = mean(ypred~=ytr);
    end
end
