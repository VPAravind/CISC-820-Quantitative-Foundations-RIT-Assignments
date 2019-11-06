%function 1 from the project
function y = func1(x)
    
    %disp (size(x))
    i = [1:1:100];
    x_squared = x.^2;
    
    y = dot (i, x_squared);

end

