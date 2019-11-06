function H = h_func2 (x)

	m = 500;
	n = 100;

	fid = fopen('fun2_A.txt','r');
  	A = fscanf(fid,'%e ',[m,n]);
  	fclose(fid);

	
	fid = fopen('fun2_b.txt','r');
	b = fscanf(fid, '%e', [m,1]);
	fclose(fid);

	H = A'*diag(1./((b - A*x).^2))*A;

end
