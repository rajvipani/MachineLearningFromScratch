function [ypred] = test_boosted_dt(Xte, alpha, DTCell)
    [no_of_samples, ~] = size(Xte);
    ypred = zeros(no_of_samples, 1);
%     for i = 1:no_of_samples
%         res = 0;
%         for t = 1:length(alpha)
%             tree = DTCell{t};
%             res = res + alpha(t)*predict(tree,Xte(i,:));
%         end
%         ypred(i) = sign(res);
%     end
    for t = 1:length(alpha)
        tree = DTCell{t};
        ypred = ypred + alpha(t)*predict(tree,Xte);
    end
    ypred = sign(ypred);
end