function avg_error = Cross_Validate(X,y,p,k)

errors = zeros(k,1);
n = length(y);
step = floor(n/k);

x_updated = basis_expansion(X,p,1);
%x_updated = expansion(x);
for i = 1:k
    x_train = x_updated;
    y_train = y;
    
    if i == k
        test_fold_x = x_updated(:,(i-1)*step + 1:n);
        test_fold_y = y((i-1)*step + 1: n);        
        
        x_train(:,(i-1)*step + 1:step) = [];
        y_train((i-1)*step + 1:step) = [];
                                 
    else
        test_fold_x = x_updated(:,(i-1)*step + 1: i*step);
        test_fold_y = y((i-1)*step + 1 : i*step);
        x_train(:,(i-1)*step + 1: i*step) = [];
        y_train((i-1)*step + 1: i*step) = [];
        
    end
           
    %[M,s] = Transformation(x_train , y_train);
    
    %w = M\s;
    w = pinv(x_train')*y_train;
    %w = x_train'\y_train;
    %w = linsolve(x_train',y_train);
    pred = transpose(w) * test_fold_x;
    errors(i) = Square_Error(pred', test_fold_y)/length(test_fold_y);

end
avg_error = mean(errors);
    

end