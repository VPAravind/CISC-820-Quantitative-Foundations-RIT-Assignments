function Test_Func_Bern()

    %N = [10];
    N = [10,100,1000,10000,20000,30000];
    bern_p = [0:0.01:1];
    total_values = length(bern_p);
	%alphas = [0.05,0.25];
    no_of_reps = 2000;
	%theta = 0.001;
    %max_mis = 0;
    
    for func_no = [1,2,3,4,5,6,7,8,9,10]
        ch_func = int2str(func_no);
        ch_func = strcat('res_func',ch_func);
        fileID = fopen(strcat(ch_func,'_bern.txt'), 'a');
        for berns = 1:total_values
            
		theta = bern_p(berns);
		
                for n = N

                    hits = 0;

                    for i = 1:no_of_reps

                        x_samples = sample_bernoulli (n, theta);
                        %x_samples = sample_uniform(n,a,b);
                        %x_samples = sample_normal (n,0.0001,0.001);
                        %x_mean = mean(x_samples);
                        [an,bn] = ci (x_samples,func_no);                
                        if an <= theta && theta <= bn
                            hits = hits + 1;                    
                        end
                    end
                   fprintf(fileID,'N: %5d missed percentage: %1.3f func no: %d, theta: %d\n',  n, (1-hits/no_of_reps)*100,func_no,theta);    
            end
        end
        fclose(fileID);
    end
    

end

