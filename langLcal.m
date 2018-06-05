clc;clear all
Out=[];
for theta=1:89
    theta
f=10*10^6;
% theta=55;
yf=80;sg=4;lam=3*10^8/f;del=theta/180*pi;
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
xlabel('ÉäÏßÑö½Ç \Delta /¡ã');
ylabel('¹ÌÓÐËðºÄ /dB');   
grid on