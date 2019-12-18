function [idx, D] = Classification_KNN(task)

    [labels, train_data] = Read_Project_Data ('att_faces/',true);
    [labels, test_data] = Read_Project_Data ('att_faces/',false);
    [transformed_data,principle_basis, mean_features] = PCA(2, 200, train_data);

    [n_test,p_test] = size(test_data);
    [n_train, p_train] = size(train_data);

    test_data = test_data';
    mean_subtracted_test_data = test_data - repmat(mean_features,1,n_test); 
    transformed_test_data = principle_basis'*mean_subtracted_test_data;

    if task ==1

        threshold = 4.2708e+03; %this value is obtained using validation code commented below
        
        %val_idx = randi([1,280], 1, 50);
        %validation_set = transformed_data(:,val_idx);
        %transformed_data(:,val_idx) = [];
        %thresold = max (D)

        [idx, D] = knnsearch (transformed_data', transformed_test_data');

        class_labels = ones (n_test,1);
        class_labels(D > threshold) = 2; 
        test_labels = [ones(120,1); ones(30,1)*2];

        acc = sum(class_labels == test_labels)/length(test_labels);
        disp (acc)
    
    else
        
        transformed_test_data (:,121:150) = [];
        [p_test,n_test] = size(transformed_test_data);
        threshold =  3.578e+03;
        
        test_labels1 = [1:35]';
        test_labels1 = repelem(test_labels1,2);

        test_labels2 = ones(50,1)*36;
        %test_labels2 = repelem (test_labels2,10);

        test_labels = [test_labels1; test_labels2];

        train_labels = [1:35]';
        train_labels = repelem (train_labels,8); 
        
        %val_idx = randi([1,280], 1, 50);
        %validation_set = transformed_data(:,val_idx);
        %transformed_data(:,val_idx) = [];
        
        
        
        [idx, D] = knnsearch (transformed_data', transformed_test_data');
        %class_labels = ones (n_test,1);

        class_labels = train_labels(idx);
        class_labels(D > threshold) = 36;
        acc = sum(class_labels == test_labels)/length(test_labels);
        disp (acc)
        
    end
end

