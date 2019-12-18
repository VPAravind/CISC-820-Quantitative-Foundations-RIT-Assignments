function [labels,data] = Read_Project_Data(path, is_train)

    %is_train: boolean variable to indicate if reading a training data or
    %testing data     
    
    labels = ["s1","s2","s3","s4","s5","s6","s7","s8","s9","s10", "s11","s12","s13","s14","s15","s16","s17","s18","s19","s20","s21","s22","s23","s24","s25","s26","s27","s28","s29","s30","s31","s32","s33","s34","s35","s36","s37","s38","s39","s40","Other_Images"];
    train_images_per_subject = 8;
    train_no_of_subjects = 35;        

    if is_train
        
        images_left = 10 - train_images_per_subject;
        train_data = zeros(train_no_of_subjects*train_images_per_subject,92*112);
        for k = 1:train_no_of_subjects       

            updated_path = strcat( path,labels(k));
            image_names = dir (updated_path);

            for i = 3 : (length(image_names) - images_left)
                img_name = image_names(i).name;            
                fullFileName = strcat(strcat(updated_path,'/'), img_name);
                train_data((k-1)*8 + (i-2),:) = reshape(imread (convertStringsToChars(fullFileName)),1,[]);
            end
        end
        
        data = train_data;
    
    else
        
        total_subjects = 40; 
        other_images = 30;
        test_data = zeros(other_images+(total_subjects-train_no_of_subjects)*10 + train_no_of_subjects*2,92*112);

        for k = 1:train_no_of_subjects       

            updated_path = strcat( path,labels(k));
            image_names = dir (updated_path);

            for i = (3 + 8) : length(image_names) 
                img_name = image_names(i).name;            
                fullFileName = strcat(strcat(updated_path,'/'), img_name);
                %disp ((k-1)*2 + (i-2-8))
                test_data((k-1)*2 + (i-2-8),:) = reshape(imread (convertStringsToChars(fullFileName)),1,[]);
            end
        end
        
        for k = (train_no_of_subjects+1):total_subjects

            updated_path = strcat( path,labels(k));
            image_names = dir (updated_path);

            for i = 3  : length(image_names) 
                img_name = image_names(i).name;            
                fullFileName = strcat(strcat(updated_path,'/'), img_name);
                test_data((k-36)*10 + (i-2) + train_no_of_subjects*2, :) = reshape(imread (convertStringsToChars(fullFileName)),1,[]);
            end
        end
        

         for k = 41:41       

            updated_path = strcat( path,labels(k));
            image_names = dir (updated_path);

            for i = 3  : length(image_names) 
                img_name = image_names(i).name;            
                fullFileName = strcat(strcat(updated_path,'/'), img_name);
                test_data((i-2) + train_no_of_subjects*2 + (total_subjects-train_no_of_subjects)*10, :) = reshape(imread (convertStringsToChars(fullFileName)),1,[]);
            end
        end       
                
        data = test_data;
        
                        
    end
    
end

