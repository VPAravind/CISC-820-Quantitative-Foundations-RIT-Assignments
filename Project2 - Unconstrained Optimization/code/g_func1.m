%gradient for function_1
function grad = g_func1(x)
    
    i = [2:2:200];
    i = i';
    grad = x.*i;
    %disp('size of i')
    %disp(size(grad))
    
end

