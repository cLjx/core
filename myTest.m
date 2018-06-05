clc;clear
M=500;
Num=200;
z=zeros(M);
for index=1:Num
    ran=rand(3,2);
    
h=ran(1,1)*10;sigma=ran(1,2)*M/2;
i0=ran(2,1)*M;j0=ran(2,2)*M;
ia=ran(3,1)*50;ib=ran(3,2)*20;ia=ib;
for i=1:M
    for j=1:M
        z(i,j)=h*exp(-((i-i0)^2*ia^2+(j-j0)^2*ib^2)/2/sigma^2)+z(i,j);
    end
end
end
mesh([1:M],[1:M],z)