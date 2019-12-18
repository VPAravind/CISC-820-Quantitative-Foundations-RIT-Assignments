function all_plots()

	[labels,train_data] = Read_Project_Data('att_faces/', true);
	[Y,principle_basis, mean_features] = PCA(2, 200, train_data);
    
%     PXN P dimentions N exa


		
	subplot(2,2,1), imshow(reshape(principle_basis(:,1),[112,92]),[])
	title ('1st Eigen Face')

	subplot(2,2,2), imshow(reshape(principle_basis(:,2),[112,92]),[])
	title ('2nd Eigen Face')
	
	subplot(2,2,3), imshow(reshape(principle_basis(:,3),[112,92]), [])
	title ('3rd Eigen Face')

	subplot(2,2,4), imshow(reshape(principle_basis(:,200),[112,92]), [])
	title ('200th Eigen Face')		


	figure


	[p,n] = size (Y);
	recons = Y' * principle_basis';
    recons = recons + repmat(mean_features,1,n)';
	subplot(2,2,1), imshow(reshape(recons(1,:),[112,92]),[])
	title ('Reconstructed from 200 Eigen Vectors')		

	[Y,principle_basis, mean_features] = PCA(2, 150, train_data);
	recons = Y' * principle_basis';
    recons = recons + repmat(mean_features,1,n)';
	subplot(2,2,2), imshow(reshape(recons(1,:),[112,92]),[])
	title ('Reconstructed from 150 Eigen Vectors')		

	[Y,principle_basis, mean_features] = PCA(2, 100, train_data);
	recons = Y' * principle_basis';
    recons = recons + repmat(mean_features,1,n)';
	subplot(2,2,3), imshow(reshape(recons(1,:),[112,92]),[])
	title ('Reconstructed from 100 Eigen Vectors')		

	[Y,principle_basis, mean_features] = PCA(2, 50, train_data);
	recons = Y' * principle_basis';
    recons = recons + repmat(mean_features,1,n)';
	subplot(2,2,4), imshow(reshape(recons(1,:),[112,92]),[])
	title ('Reconstructed from 50 Eigen Vectors')		

	%[Y,principle_basis, mean_features] = PCA(2, 200, train_data);

       %imshow(reshape(principle_basis(:,250),[112,92]), [])

end
