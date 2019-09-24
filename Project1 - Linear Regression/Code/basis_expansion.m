function x_updated = basis_expansion(X,degree,add_bias)
%expands the input to the degree of polynomial specified
% X is no. of features * no. of samples

[no_of_features, no_of_examples] = size(X); 

x_updated = zeros(no_of_features*degree + add_bias, no_of_examples);

x_updated(1:no_of_features,:) = X;

for i = 2:degree
    x_updated(no_of_features*(i-1) + 1:no_of_features*(i),:) = X.^i;
end

if add_bias == 1
    x_updated(no_of_features*degree + add_bias,:) = ones(1,no_of_examples);
    

end

