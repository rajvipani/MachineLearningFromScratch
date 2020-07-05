function [M, obj] = kmeans(X, k, T)
    [no_of_samples, no_of_features] = size(X);
    M = zeros(k,no_of_features);
    obj = zeros(1,T);
    idx = randperm(no_of_samples);
    M = X(idx(1:k), :);
    for t = 1:T
        M_old = M;
        d = [];
        for i = 1:k
            d = [d sum((X - repmat(M(i,:),no_of_samples,1)).^2,2)];
        end
        [~,c] = min(d,[],2);
        for i = 1:k
            M(i,:) = mean(X(c == i,:),1);
        end
        cost = 0;
        for i = 1:k
            cost = cost + sum(sum((X(c == i,:) - repmat(M(i,:),sum(c == i),1)).^2,2));           
        end
        obj(t) = cost;
        if sum(sum(abs(M_old-M))) < 1e-5
            for i = t:T
                obj(i) = cost;
            end
            return
        end
    end
end