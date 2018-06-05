clc;clear all
f=3*10^-3;
% yr;   %ֲ�����糣��1.5-2.0
%ֲ����������ˮ��0.5 
Mg=0.5;
%����ֲ��������ˮ��
rou=0.5*10^3;%��ֲ�����ܶ�
mv=Mg*rou/(1-Mg*(1-rou))/100;
yr=1.7+3.2*mv+6.5*mv^2
vf=mv*(0.82*mv+0.166);   %����ˮ�������
vb=31.4*mv^2/(1+59.5*mv^2);   %���ˮ�������
%����ˮ�����ӵ絼�ʣ�S/m��
%sΪ�ζ� 1 4 7 10 %
s=0.1;
del=0.16-0.0013*s^2;  
%ֲ���糣��
yv=yr+vf*(4.9+75/(1+sqrt(-1)*f/18)-sqrt(-1)*18*del/f)+vb*(2.9+55/(1+(sqrt(-1)*f/0.00018)^0.2));
vv=0.5;     %ֲ���������
%ɭ�ֵ�Ч��糣��
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
xlabel('�������� \Delta /���㣩');
ylabel('������� /dB');   
grid on

