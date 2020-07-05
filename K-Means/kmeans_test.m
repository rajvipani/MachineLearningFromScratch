clear 
close all
clc

% load dataset
load('mnist.mat')

T = 10;
Xtr = Xtr';
K = [2 4 6 8 10 12 14];
mean_obj = zeros(10, T);
std_obj = zeros(10, T);
mean_obj_final = zeros(1, length(K));
std_obj_final = zeros(1, length(K));
for k = 1:length(K)
    for iter = 1:10
        [centroids,obj] = kmeans(Xtr,K(k),T);
        mean_obj(iter,:) = obj;
        std_obj(iter,:) = obj;
    end
    mean_obj_final(k) = mean(mean(mean_obj));
    std_obj_final(k) = std(mean(std_obj));
end
subplot(1,2,1)
plot(K,mean_obj_fianl)
hold on
xlabel('Value of K')
ylabel('Value of Objective Function')
title('K v/s Mean of Objective Function')
subplot(1,2,2)
plot(K, std_obj_final)
xlabel('Value of K')
ylabel('Value of Objective Function')
title('K v/s Standard Deviation of Objective Function')