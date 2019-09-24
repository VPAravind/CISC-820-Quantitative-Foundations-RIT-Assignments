warning('on','all')

%This script runs the project
path = 'traindata.txt';
[X,y] = load_data(path,true); %second parameter is a flag for train or test data
%X = x_updated;
%X = X.*10;
degrees_to_check = 5;
degree_error = zeros(degrees_to_check,1);
k = 926;
X = [X; sin(X)];
for i = 1:degrees_to_check
    degree_error(i) = Cross_Validate(X,y,i,k);
    fprintf ('Degree = %d ; Error = %3f \n', i, degree_error(i))
end

[min_error,ind] = min(degree_error);
fprintf ('Minimum error Degree = %d ; Error = %3f \n', ind, degree_error(ind))
disp ('Visualizing the results')

figure
plot(degree_error, 'k+-')
title ('Mean Cross Validation against Polynomial Order')
xlabel('Order of Polynomial')
ylabel('Mean Cross Validation Error')

%now the best fit on all the data
x_updated = basis_expansion(X,ind,1);
[R,w] = project1(x_updated, y);
fprintf ('Mean Training Error = %3f \n', R/length(y));

y_train_pred = w' * x_updated;
figure
plot(y, 'bd')
hold on
plot(y_train_pred','kd')
title ('Comparing Y true and Y pred on our best fit')
legend ('Y true', 'Y pred')
xlabel('ith Example')
ylabel('Value of Y')

disp('Now calculating y_pred for the test set')
test_path = 'testinputs.txt';
[x_test,y] = load_data(test_path,false);
x_test_expanded = [x_test; sin(x_test)];
x_test_expanded = basis_expansion(x_test_expanded,ind,1);

y_pred = w' * x_test_expanded;

fprintf ('Making sure the dimensions are correct for y_pred %d \n', length(y_pred));
save('y_pred.mat','y_pred');
disp('pred vector saved in the file y_pred.mat')



