function [z]=erweihailangboxing(fengji,pinpushu,jiaodushu)
if nargin<3
   fengji=5;
   pinpushu=3;
   jiaodushu=8;
end
wavewmin = [2.438306 1.462983 1.044989 0.812770 0.664988 0.562683 0.487659 0.430288];
wavewmax = [16.444115 9.866469 7.047480 5.481373 4.484760 3.794799 3.288826 2.90190];
wavewp=[4.053570 2.432142 1.737244 1.351190 1.105519 0.935439 0.810714 0.715336];

%-----------------------------------------------------
u=[3,5,7,9,11,13,15,17];
%---------------------------------------------------

if fengji>8
    fengji=8;
end
if fengji<1
    fengji=1;
end
fi=fengji;
wmin=wavewmin(fi);
wmax=wavewmax(fi);
wp=wavewp(fi);
ui=u(fi);
M=pinpushu;
N=jiaodushu;
wavewn=(wmax-wmin)/M;
thetawn=pi/N;
dx=1;
dy=1;
x=[0:dx:20];
y=[0:dy:20];
[x,y]=meshgrid(x,y);

Z_final = [];
Z_line = [];
for col = 1:10
    Z_line = [];
    for line = 1:10
        z=zeros(size(x));
        for wi=1:M
            for ki=1:N
                theta=-pi/2+(ki-1)*thetawn;
                epsin=rand()*2*pi;
                w=wmin+(wi-1)*wavewn+wavewn/2;
                swi=0.81*exp(-7400/(w*ui+eps).^4)*2*(cos(theta)).^2/(pi*(w.^5+eps));
                an=sqrt(2*swi*wavewn*theta);
                z1=w*w*x*cos(theta*(1+rand()))/9.8+w*w*y*sin(theta*(1+rand()))/9.8+epsin;
                switch randi([1 4])
                    case 1
                        z=an*cos(z1*(1+rand()))+z;
                    case 2
                        z=an*sin(z1*(1+rand()))+z;
                    case 3
                        z=an*cos(z1*(1-rand()))+z;
                    case 4
                        z=an*sin(z1*(1-rand()))+z;
                end
            end
        end
        Z_line = [Z_line,z];
    end
    Z_final = [Z_final;Z_line];
end

Z_final = real(Z_final)-min(min(real(Z_final)));


x=[0:dx:209];
y=[0:dy:209];
[x,y]=meshgrid(x,y);
figure;
mesh(x,y,Z_final);
%axis tight;
for i = 1:200
    j = i/2;
    axis([0 200 j 100+j 0 8]);
    getframe();
end
% shading interp;
% lightangle(-45,30);
% set(findobj(gca,'type','surface'),'FaceLighting','phong','AmbientStrength',.3,'DiffuseStrength',.8,...
%     'SpecularStrength',.9,'SpecularExponent',200);


