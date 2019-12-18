function [class_labels] = Classification(task)

    
    [labels, train_data] = Read_Project_Data ('att_faces/',true);
    [labels, test_data] = Read_Project_Data ('att_faces/',false);
    [transformed_data,principle_basis, mean_features] = PCA(2, 200, train_data);
    
    [n_test,p_test] = size(test_data);
    [n_train, p_train] = size(train_data);
    
    test_data = test_data';
    mean_subtracted_test_data = test_data - repmat(mean_features,1,n_test); 
    transformed_test_data = principle_basis'*mean_subtracted_test_data;
     
    %Now performing task1 to identify face or not face
    if task == 1
        task1_degree = 3;
        %transform labels to 1 for face, 2 for not face
        train_labels = ones(280,1);

        %one hot encode train labels    
        Y = bsxfun(@eq, train_labels(:), 1:2);
        Y = Y';

        transformed_data = basis_expansion(transformed_data, task1_degree, 1);
        W = (Y* transformed_data')*pinv(transformed_data*transformed_data');
        %training completed

        %Now preprocess test data

        transformed_test_data = basis_expansion(transformed_test_data, task1_degree, 1);

        test_labels = [ones(120,1); ones(30,1)*2];

        Outputs = W*transformed_test_data;
        %disp (Outputs)
        [scores, class_labels] = max(Outputs);
        acc = sum(class_labels == test_labels')/length(test_labels);
        disp (acc)
    else
        %Task2 Label Faces for subjects

        task2_degree = 1;
        %drop images other than faces
        transformed_test_data (:,121:150) = [];

        test_labels1 = [1:35]';
        test_labels1 = repelem(test_labels1,2);

        test_labels2 = ones(50,1)*36;
        %test_labels2 = repelem (test_labels2,50);

        test_labels = [test_labels1; test_labels2];

        train_labels = [1:35]';
        train_labels = repelem (train_labels,8);

        Y = bsxfun(@eq, train_labels(:), 1:36);
        Y = Y';

        transformed_data = basis_expansion(transformed_data, task2_degree, 1);
        
        W = (Y* transformed_data')*pinv(transformed_data*transformed_data');
        transformed_test_data = basis_expansion(transformed_test_data, task2_degree, 1);
        
        Outputs = W*transformed_test_data;
        
        [scores, class_labels] = max(Outputs);
        acc = sum(class_labels == test_labels')/length(test_labels);
        disp (acc)

        
    end
end

