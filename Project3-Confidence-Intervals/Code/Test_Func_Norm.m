function Test_Func_Bern()

    %N = [10];
    N = [10,100,1000,10000,20000];
    mu_normal = [0.5,0.5,0.001,0.4,0.99];
    sig_normal = [0.1,0.15,0.0001,0.01,0.001];
    total_values = length(mu_normal);
    
	%alphas = [0.05,0.25];
    no_of_reps = 2000;
	%theta = 0.001;
    %max_mis = 0;
    
    for func_no = [1,2,3,4,5,6,7,8,9,10]
        ch_func = int2str(func_no);
        ch_func = strcat('res_func',ch_func);
        fileID = fopen(strcat(ch_func,'_Norm.txt'), 'a');
        for norms = 1:total_values
            
		theta = mu_normal(norms);
		sig = sig_normal(norms);
		mu = mu_normal(norms);
                for n = N

                    hits = 0;

                    for i = 1:no_of_reps

                        %x_samples = sample_bernoulli (n, theta);
                        %x_samples = sample_uniform(n,a,b);
                        x_samples = sample_normal (n,sig,mu);
                        %x_mean = mean(x_samples);
                        [an,bn] = ci (x_samples,func_no);                
                        if an <= theta && theta <= bn
                            hits = hits + 1;                    
                        end
                    end
                   fprintf(fileID,'N: %5d missed percentage: %1.3f func no: %d, mu: %1.3f, sig: %1.3f\n',  n, (1-hits/no_of_reps)*100,func_no,mu,sig);    
            end
        end
        fclose(fileID);
    end
    

end

