function main()

disp("Plotting all eigenfaces and reconstructions for different number of eigenfaces");

all_plots();

disp("Doing Task 1 - Face recognition");

[class_labels] = Classification(1);

disp("Doing Task 2 - Face identification");

[class_labels] = Classification(2);

disp("Doing Task 1 - Face recognition using KNN")

[class_labels] = Classification_KNN(1);

disp("Doing Task 2 - Face identification using KNN")

[class_labels] = Classification_KNN(2);


disp("Doing Task 1 - Face recognition using K-means")

IDX = Classification_Kmeans(1);


disp("Doing Task 2 - Face identification using KNN")

IDX = Classification_Kmeans(2);



end
