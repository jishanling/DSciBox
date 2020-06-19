function N = vecnorm(A,p,dim)
if nargin < 2
    p = 2;
end
if nargin < 3
    dim = 1;
end
if isrow(A)
    dim = 2;
end
N = sum(abs(A).^p,dim).^(1/p);
end
