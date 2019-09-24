function [R,w] = project1(X,y)
%perform steps to calculate error
%[M,s] = Transformation(X,y);
%w = M\s;
%w = pinv(M)*s;
w = pinv(X')*y;
%w = X'\y;
pred = transpose(w) * X;
R = Square_Error(y , pred');
end

