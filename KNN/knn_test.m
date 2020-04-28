close all; clear all; clc

load mnist;

k = input('Enter the Value of K:');

predicted_labels = knn_classification(k,full(Xtr)', ytr, full(Xte)');

accuracy = (sum(abs(predicted_labels' - yte))/length(yte))*100