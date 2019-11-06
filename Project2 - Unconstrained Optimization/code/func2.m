%function 2 from the project
function y = func2(x)
    
	m = 500;
	n = 100;
	y = 0;

	fid = fopen('fun2_A.txt','r');
  	A = fscanf(fid,'%e ',[m,n]);
  	fclose(fid);

	fid = fopen('fun2_b.txt','r');
	b = fscanf(fid, '%e', [m,1]);
	fclose(fid);

	fid = fopen('fun2_c.txt','r');
	c = fscanf(fid, '%e', [n,1]);
	fclose(fid);

	if (~Pass_Constraint (x))
		disp('X out of domain')
		return
	end

	product = dot(c,x);
	%i = [1:1:500];
	summation = sum (log(b - A*x));
	y = product - summation;

end
