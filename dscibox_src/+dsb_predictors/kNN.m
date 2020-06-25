function [Ypred,I] = kNN(X,Y,Xnew,k)
[C,~,Y] = unique(Y);
% Calculate the distance between any two instances
D = dsb_utilities.cdist(Xnew,X);
% Find the nearest instances
[~,I] = sort(D,2);
I = I(:,1:k);
Ynearest = Y(I);
% Majority vote on a class labels based on the nearest instances list
frequencies = histc(Ynearest,1:max(Y),2);
[~,J] = max(frequencies,[],2);
Ypred = C(J);
end
