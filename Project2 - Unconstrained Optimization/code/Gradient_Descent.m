function [x, minima,steps_done] = Gradient_Descent(func,grad_func,x,alpha_start,constraint)

    %Hyperparameters
    max_steps = 1000;
    tolerance = 0.000001;
    %minima = [];
    
    good_enough = false;
    max_steps_done = false;
    steps_done = 0;
    
    while ~good_enough && ~max_steps_done
        grad_x = grad_func(x);
        direction = (-grad_x);
        %alpha = 1;
        alpha = Back_Track (func,grad_x,direction,x,alpha_start,constraint); %in the opposite direction of gradient
        x_updated = x + direction*alpha;
        steps_done = steps_done + 1;
        
        if abs(func(x_updated) - func(x)) < tolerance
            good_enough = true;
        end
        
        if steps_done >= max_steps
            max_steps_done = true;
        end
        
        %minima = [minima func(x)];
        x = x_updated;
    end
    
    %disp ('No. of Iterations = ') 
    %disp (steps_done)
    minima = func (x);
    
end
