function P = pca(X)
% Calculate the mean of each column
M = mean(X);
% Center columns by subtracting column means
C = X - repmat(M,size(X,1),1);
% Calculate covariance matrix of centered matrix
V = cov(C);
% Eigendecomposition of covariance matrix
[vectors,values] = eig(V);
[~,i] = sort(sum(values),'descend');
% Project data
P = (vectors(:,i)'*C')';
end
