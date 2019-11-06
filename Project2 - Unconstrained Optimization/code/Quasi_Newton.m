function [x, minima, steps_done] = Quasi_Newton(func,grad_func,x,alpha_start,constraint)

    %Hyperparameters
    max_steps = 10000;
    tolerance = 0.000001;
    F = eye(length(x));
    
    good_enough = false;
    max_steps_done = false;
    steps_done = 0;
    
    while ~good_enough && ~max_steps_done                
        

        grad_x = grad_func(x);
        direction =  -F*grad_x;
        alpha = Back_Track (func,grad_func(x),direction,x,alpha_start,constraint);
        x_updated = x + alpha*direction;
        steps_done = steps_done + 1;
        
        
        if  abs ( func(x_updated) - func(x)) < tolerance
            good_enough = true;            
        end
        
        if steps_done >= max_steps
            max_steps_done = true;
        end
        
        s = x_updated - x;
        y = grad_func(x_updated) - grad_x;
        F = F + ((y'*(F*y + s))/(y'*s)^2)*(s*s') - (s*y'*F + F*y*s')/(y'*s);
        x = x_updated;
    end
    
    %disp ('No. of Iterations = ') 
    %disp (steps_done)
    minima = func (x);
    

end
