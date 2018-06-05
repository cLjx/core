function isOk=langFun(i,j,ij,LENGTH,Zsize,alpha,theta,zz)
% j+0 i+1
% LENGTH=0.11;
% Zsize=31;
isOk=1;
% load('langZ.mat', 'z');
% zz=zz*0.001;
% z=ones(5);

if ij==0
%    y=kx+b
if zz(i,j+1)>zz(i,j)
    k=tan(pi/2-2*alpha-theta);
else 
    k=tan(theta-2*alpha);
end
    b=zz(i,j)-j*k;
    for j=j:Zsize-1
        if j*k+b<zz(i,j)
            isOk=0;
            break;
        end
    end
elseif ij==1
%    y=kx+b
if zz(i+1,j)>zz(i,j)
    k=tan(pi/2-2*alpha-theta);
else 
    k=tan(theta-2*alpha);
end
    b=zz(i,j)-i*k;
    for i=i:Zsize-1
        if i*k+b<zz(i,j)
            isOk=0;
            break;
        end
    end    
end

    





