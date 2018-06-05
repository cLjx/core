function [Z] = Wave(X,Y)
    Z1 = zeros(size(X,1),size(X,2));
    Z2 = zeros(size(X,1),size(X,2));
    t1 = rand();
    t2 = rand();
    for i = 1: size(X,1)
        for j = 1: size(X,2)
            Z1(i,j) = t1 + (-1)^randi([1 2])*rand();
            t1 = Z1(i,j);
                        
            Z2(j,i) = t2 + (-1)^randi([1 2])*rand();
            t2 = Z2(j,i);
            
        end
    end
    Z = Z1 + Z2;
end