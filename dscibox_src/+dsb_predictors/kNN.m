function [Ypred,I] = kNN(X,Y,Xnew,k)
[C,~,Y] = unique(Y);
% calculate the distances between the instances
D = dsb_utilities.cdist(Xnew,X);
% sort the distances in ascending order
[~,I] = sort(D,2);
% select the k-nearest instances
I = I(:,1:k);
Ynearest = Y(I);
% count label frequencies
frequencies = histc(Ynearest,1:max(Y),2);
% select the most frequent label
[~,J] = max(frequencies,[],2);
Ypred = C(J);
end
