clear
clc
close all

load a9a

tic
T=500;
[alpha, DTCell, tr_err] = train_boosted_dt(Xtr, ytr, T);
toc

te_err=zeros(1,T);
for i=1:T
    [ypred] = test_boosted_dt(Xte, alpha(1:i), DTCell(1:i));
    te_err(i) = mean(ypred~=yte);
end

plot(tr_err)
hold on
plot(te_err,'k')
legend('Training error', 'Test error')
xlabel('Boosting iterations')
ylabel('Error')


