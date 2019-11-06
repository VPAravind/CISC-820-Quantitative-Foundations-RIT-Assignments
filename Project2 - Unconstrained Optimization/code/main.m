function  main()

    initial_alpha = 1;
    x_start = [100:100:10000]';
    x2_start = zeros(100,1);
    x3_start = [1.5;2];
    
    disp('****Running Gradient Descent on function 1 with x_start = transpose([100:100:10000]) and alpha = 1****')
    [x,minima,itrs] = Gradient_Descent (@func1,@g_func1,x_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    
    disp('****Running Newton Method on function 1 with x_start = transpose([100:100:10000]) and alpha = 1****')
    [x,minima,itrs] = Newton_Method (@func1,@g_func1,@h_func1,x_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    disp('****Running Quasi-Newton on function 1 with x_start = transpose([100:100:10000]) and alpha = 1****')
    [x,minima,itrs] = Quasi_Newton (@func1,@g_func1,x_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    disp('****Running Conjugate Gradient on function 1 with transpose([100:100:10000]) and alpha = 1****')
    [x,minima,itrs] = Conjugate_Gradient (@func1,@g_func1,x_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    
    disp('****Running Gradient Descent on function 2 with x_start = zeros(100,1) and alpha = 1****')
    [x,minima,itrs] = Gradient_Descent (@func2,@g_func2,x2_start,initial_alpha,true);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)

    
    disp('****Running Newton Method on function 2 with x_start = zeros(100,1) and alpha = 1****')
    [x,minima,itrs] = Newton_Method (@func2,@g_func2,@h_func2,x2_start,initial_alpha,true);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    disp('****Running Quasi-Newton on function 2 with x_start = zeros(100,1) and alpha = 1****')
    [x,minima,itrs] = Quasi_Newton (@func2,@g_func2,x2_start,initial_alpha,true);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    disp('****Running Conjugate Gradient on function 2 with x_start = zeros(100,1) and alpha = 1****')
    [x,minima,itrs] = Conjugate_Gradient (@func2,@g_func2,x2_start,initial_alpha,true);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    
    disp('****Running Gradient Descent on function 3 with x3_start = [1.5;2] and alpha = 1****')
    [x,minima,itrs] = Gradient_Descent (@func3,@g_func3,x3_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)

    
    disp('****Running Newton Method on function 3 with x3_start = [1.5;2] and alpha = 1****')
    [x,minima,itrs] = Newton_Method (@func3,@g_func3,@h_func3,x3_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    disp('****Running Quasi-Newton on function 3 with x3_start = [1.5;2] and alpha = 1****')
    [x,minima,itrs] = Quasi_Newton (@func3,@g_func3,x3_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
    
    disp('****Running Conjugate Gradient on function 3 with x3_start = [1.5;2] and alpha = 1****')
    [x,minima,itrs] = Conjugate_Gradient (@func3,@g_func3,x3_start,initial_alpha,false);
    fprintf ('iterations = %d ; Minima = %f \n', itrs, minima)
 
           
end

