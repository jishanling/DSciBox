function e = entropy(Y)
%Information Entropy
%
% SYNTAX
% 1. e = dsb_utilities.entropy(Y)
%
% DESCRIPTION
% 1. Returns the entropy for a vector.
%
% Y is a vector with various elements.
%
% EXAMPLE
% 1.
%      Y = {'setosa';'versicolor';'virginica'};
%      e = dsb_utilities.entropy(Y)
%      e =
%          1
%
% David Alan de Oliveira Ferreira (http://lattes.cnpq.br/3863655668683045)
% PhD student in Electrical Engineering from the Federal University of Amazonas
% e-mail: ferreirad08@gmail.com

% Calculate the probabilities
p = histc(Y,unique(Y))/numel(Y);
% Calculate the entropy
e = -sum(p.*log2(p));
end
