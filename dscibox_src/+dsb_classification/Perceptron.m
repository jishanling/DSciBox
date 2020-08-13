classdef Perceptron
%Perceptron with Delta Rule

properties
    alpha = 0.01 % Learning Rate
    n_epochs = 2000
    w
    bias
    C
end
methods
    function obj = Perceptron(alpha,n_epochs)
        if nargin > 0
            obj.alpha = alpha;
        end
        if nargin > 1
            obj.n_epochs = n_epochs;
        end
    end
    function obj = fit(obj,X,Y)
        [obj.C,~,Y] = unique(Y); Y = Y-1;
        
        obj.w = rand(1,size(X,2));
        obj.bias = rand;

        for j = 1:obj.n_epochs
            cum_error = 0;
            for i = 1:size(X,1)
                output = sum(X(i,:).*obj.w) + obj.bias;
                Ypred = output >= 0; % Loss Function
                if Ypred ~= Y(i)
                    error = Y(i) - Ypred;
                    obj.w = obj.w + obj.alpha*error.*X(i,:);
                    cum_error = cum_error + 1;
                end
            end
            if cum_error == 0, break, end
        end
    end
    function Ypred = predict(obj,Xnew)
        output = sum(Xnew.*repmat(obj.w,size(Xnew,1),1),2) + obj.bias;
        Ypred = output >= 0; % Loss Function
        Ypred = obj.C(Ypred+1);
    end
end
end
