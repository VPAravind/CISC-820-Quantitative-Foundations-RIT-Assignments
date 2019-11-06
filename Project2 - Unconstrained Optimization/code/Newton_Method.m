function [x, minima, steps_done] = Newton_Method(func,grad_func,hessian_func,x,alpha_start,constraint)

    %Hyperparameters
    max_steps = 1000;
    tolerance = 0.000001;
    
    
    good_enough = false;
    max_steps_done = false;
    steps_done = 0;
    while ~good_enough && ~max_steps_done
        
        grad_x = grad_func(x);
	    hessian_x = hessian_func(x);
        direction = hessian_x\(-grad_x);
        alpha = Back_Track (func,grad_x,direction,x,alpha_start,constraint);
        x_updated = x + alpha*direction;
        steps_done = steps_done + 1;
        
        if abs(func(x_updated) - func(x)) < tolerance
            good_enough = true;
        end
        
        if steps_done >= max_steps
            max_steps_done = true;
        end
        
        x = x_updated;
        %disp(x)
    end
    
    %disp ('No. of Iterations = ') 
    %disp (steps_done)
    minima = func (x);
    

end
