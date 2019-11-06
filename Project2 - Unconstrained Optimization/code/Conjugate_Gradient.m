function [x,minima, steps_done] = Conjugate_Gradient (func,g_func,x,alpha_start,constraint)

	max_steps = 1000;
    tolerance = 0.000001;
    
    
    good_enough = false;
    max_steps_done = false;
    steps_done = 0;

	direction = -g_func(x);
    
    while ~good_enough && ~max_steps_done
		grad_x = g_func(x);
		alpha = Back_Track (func,grad_x,direction,x,alpha_start,constraint);
		x_updated = x + alpha * direction;
		grad_x_updated = g_func(x_updated);
		Beta = (dot(grad_x_updated,grad_x_updated))/(dot(grad_x,grad_x));
		direction = -grad_x_updated + Beta*direction;
		

		steps_done = steps_done + 1;
        
        if grad_x == 0
            good_enough = true;
        end
        
        if steps_done >= max_steps
            max_steps_done = true;
        end
        
		x = x_updated;
    end
    
    %disp ('No. of Iterations = ') 
    %disp (steps_done)
    minima = func (x);
    

end

	
