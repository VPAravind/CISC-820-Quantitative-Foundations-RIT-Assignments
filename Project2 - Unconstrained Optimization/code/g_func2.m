function grad = g_func2(x)

	m = 500;
	n = 100;

	fid = fopen('fun2_A.txt','r');
  	A = fscanf(fid,'%e ',[m,n]);
  	fclose(fid);

	
	fid = fopen('fun2_b.txt','r');
	b = fscanf(fid, '%e', [m,1]);
	fclose(fid);

	fid = fopen('fun2_c.txt','r');
	c = fscanf(fid, '%e', [n,1]);
	fclose(fid);

	grad = c + A'*(1./(b - A*x));

end
