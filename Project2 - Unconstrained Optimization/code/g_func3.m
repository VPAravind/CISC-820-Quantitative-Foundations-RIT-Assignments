function grad = g_func3 (x)

	grad = [-400*(x(2) - x(1)^2)*x(1) - 2*(1-x(1)); 200*(x(2) - x(1)^2)]; 

end
