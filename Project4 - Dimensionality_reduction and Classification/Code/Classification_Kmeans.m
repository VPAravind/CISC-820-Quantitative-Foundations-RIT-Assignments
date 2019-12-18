function [idx] = Classification_Kmeans(task)


    [labels, train_data] = Read_Project_Data ('att_faces/',true);
    [labels, test_data] = Read_Project_Data ('att_faces/',false);
    [transformed_data,principle_basis, mean_features] = PCA(2, 200, train_data);

    [n_test,p_test] = size(test_data);
    [n_train, p_train] = size(train_data);

    test_data = test_data';
    mean_subtracted_test_data = test_data - repmat(mean_features,1,n_test); 
    transformed_test_data = principle_basis'*mean_subtracted_test_data;

    if task ==1

        
        idx = kmeans (transformed_test_data', 2);
        
    else
        
        transformed_test_data (:,121:150) = [];
        idx = kmeans (transformed_test_data', 40);
                       
    end
        
end

