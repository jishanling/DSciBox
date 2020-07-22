classdef LinearRegression
%Linear Regression
%
% SYNTAX
% 1. reg = dsb_predictors.LinearRegression()
%    reg = reg.fit(X,Y)
%    Ypred = reg.predict(Xnew)
%
% DESCRIPTION
% 1. Returns the regression to new observations of an explanatory (independent) variable. 
%
% X is a vector with M observations of an explanatory (independent) variable.
% Y is a vector with respective M observations of an explained (dependent)
% variable.
%
% EXAMPLE
% 1.
%      X = [2,3,9,6];
%      Y = [5,7,12,8];
%      reg = LinearRegression().fit(X,Y);
%      reg.coeff
%      ans =
%          0.9000 3.5000
%      reg.R_squared
%      ans =
%          0.9346
%
%      Ynew = [2,3,9,6];
%      Ypred = reg.predict(Xnew)
%      Ypred =
%          5.3000    6.2000   11.6000    8.9000
%
% David Alan de Oliveira Ferreira (http://lattes.cnpq.br/3863655668683045)
% PhD student in Electrical Engineering from the Federal University of
% Amazonas 
% e-mail: ferreirad08@gmail.com

properties
    n
    coeff
    R_squared
end
methods
    function obj = LinearRegression(n)
        if nargin > 0
            obj.n = n;
        end
    end
    function obj = fit(obj,X,Y)
        % calculating the linear regression coefficients
        a = cov(X,Y)/var(X);
        b = mean(Y)-a*mean(X);
        obj.coeff = [a, b];
        
        % calculating the Pearson correlation coefficient (rho) and the
        % determination coefficient (R^2)
        Ypred = predict(obj,X);
        rho = cov(Y,Ypred)/(std(Y)*std(Ypred));
        obj.R_squared = rho*rho;
    end
    function Ypred = predict(obj,Xnew)
        % estimating points of the line
        Ypred = obj.coeff(1)*Xnew+obj.coeff(2);
    end
end
end

% defining the covariance function
function r = cov(x,y)
    r = mean((x-mean(x)).*(y-mean(y)));
end

% defining the variance function
function r = var(x)
    r = cov(x,x);
end

% defining the standard deviation function
function r = std(x)
    r = var(x)^(1/2);
end