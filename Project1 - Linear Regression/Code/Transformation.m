%Calculate M and S
function [M,s] = Transformation (Z,y)
    %n = length (y);
    [p,n] = size(Z);
    %p = p(1);
    
    M = zeros(p,p);
    s = zeros (p,1);
    
    %for i = 1:n
    %    M = M + Z(:,i) * transpose(Z(:,i))
    %    s = s + Z(:,i) * y(i)
    %end
    M = Z * transpose(Z);
    s = Z * y;