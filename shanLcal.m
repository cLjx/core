clc;clear all
f=3*10^-3;
% yr;   %植物体介电常数1.5-2.0
%植物体重量含水量0.5 
Mg=0.5;
%整个植物的体积含水量
rou=0.5*10^3;%干植物体密度
mv=Mg*rou/(1-Mg*(1-rou))/100;
yr=1.7+3.2*mv+6.5*mv^2
vf=mv*(0.82*mv+0.166);   %自由水体积含量
vb=31.4*mv^2/(1+59.5*mv^2);   %结合水体积含量
%自由水的离子电导率（S/m）
%s为盐度 1 4 7 10 %
s=0.1;
del=0.16-0.0013*s^2;  
%植物介电常数
yv=yr+vf*(4.9+75/(1+sqrt(-1)*f/18)-sqrt(-1)*18*del/f)+vb*(2.9+55/(1+(sqrt(-1)*f/0.00018)^0.2));
vv=0.5;     %植物体积含量
%森林等效介电常数
yc=(1+vv*(yv^0.5-1))^2;
yc=real(yc);

Out=[];
for theta=1:89
    theta
f=10*10^6;
% theta=55;
yf=yc;sg=0;lam=3*10^8/f;del=theta/180*pi;
gh_=sqrt(yf-sqrt(-1)*60*lam*sg-(cos(del))^2);
gh=sqrt(yf+sqrt(-1)*60*lam*sg-(cos(del))^2);
zjs=(yf-sqrt(-1)*60*lam*sg)*sin(del);
rv=(zjs-gh_)/(zjs+gh_);
rh=(sin(del)-gh_)/(sin(del)+gh);
L=-10*log10(((abs(rv))^2+(abs(rh))^2)/2);
Out=[Out L];
end
plot(Out)
xlim([0 90])
xlabel('射线仰角 \Delta /（°）');
ylabel('固有损耗 /dB');   
grid on

