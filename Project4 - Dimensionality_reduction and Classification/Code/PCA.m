function [Y,principle_basis, mean_features] = PCA(type, vectors_needed, train_data) 
    

    %type 1 is for Eigen and 2 is for SVD
    %Y is transformed data
    %train data is passed as n*p matrix
    
    %[train_label, train_data] = Read_Project_Data('att_faces/');%readtrain (10,0);    
    train_data = train_data';
    [p,n] = size(train_data); %number of variables, number of observations
    
    mean_features = mean(train_data,2);    
    mean_subtracted_train_data = train_data - repmat(mean_features,1,n);
    
    clear train_data    
    
    if type == 1
    
        cov_train_data = (mean_subtracted_train_data*mean_subtracted_train_data')./(n-1); %A = X*X' (covariance matrix)
        [principle_basis,D] = eig(cov_train_data);
        eig_values = diag (D);
        [eig_values, index] = sort (eig_values, 'descend');
        principle_basis = principle_basis(:,index);        
        principle_basis = principle_basis(:,1:vectors_needed);
        Y = principle_basis'*mean_subtracted_train_data;
        
        %check = eig_values/sum(eig_values);
        %save ('check.mat','check')
        %eig_vars = var (principle_basis,1);
        %save ('eig_vars.mat','eig_vars');
        %C = cov(Y);
        %save('C.mat','C')
                        
        %recons = Y' * V';
        %recons = recons + repmat(mean_features,1,n)';        
        %imshow(reshape(recons(15,:),[112,92]), [])
                
    else
        
        cov_train_data = mean_subtracted_train_data./(n-1);        
        [principle_basis,S,V] = svd(cov_train_data);
        principle_basis = principle_basis(:,1:vectors_needed);
        Y = principle_basis'*mean_subtracted_train_data;
        %disp (size(Y))
        
        %recons = Y' * U  ';
        %recons = recons + repmat(mean_features,1,n)';
%         imshow(reshape(principle_basis(:,200),[112,92]), [])

    
    end
    

end

