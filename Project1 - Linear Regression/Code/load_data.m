%Load Data 
function [X,y] = load_data (path, is_train)

    data = importdata(path);
    X = data(:,1:8);
    if is_train
        y = data(:,9);
    else
        y = 0;
    end
    
    X = X';
end