clc;clear all
clc;clear
%电离层高度抠图那里的情况
h0=788-457;
w=1179-759;
h=3004-2358;
close = 300;
II=imread('dlc1.jpg');
I=II(:,:,2);
[x y]=size(I);
Out=[];
for j=1:x
    for i=1:y
        if II(j,i,1)<=100 && II(j,i,2)<=100 && II(j,i,3)<=100
            Out(j)=i-close;
            break;
        end
    end
end
min=888;max=3178;
% plot(Out(min:max));
Ou=Out(min:max);

clear I II;
II=imread('dlc1_1.jpg');
I=II(:,:,2);
[x y]=size(I);
Out1=[];
for j=1:x
    for i=1:y
        if II(j,i,1)<=100 && II(j,i,2)<=100 && II(j,i,3)<=100
            Out1(j)=i-close;
            break;
        end
    end
end
% hold on
% plot(Out1(min:max));
Ou1=Out1(min:max);

clearvars -EXCEPT Ou Ou1 res
% plot(Ou1)
% max(Ou1) max(Ou)
Ou=Ou-124;
Ou1=Ou1-124;
for i=1:2291
    Out(i,1)=Ou(2292-i)/1994*5+8;
    Out(i,2)=(i)/2291*(410-170/250*100)+170/250*100;
    Out1(i,1)=Ou1(2292-i)/1994*5+8;
    Out1(i,2)=(i)/2291*(410-170/250*100)+170/250*100;
end
clearvars -EXCEPT Out1 Out res
% figure
% hold on
% plot(Out(:,1),Out(:,2));
% plot(Out1(:,1),Out1(:,2));
% ylim([0 430]);
% xlim([8 13.4]);
% title('fig');
% grid on
figure
hold on
for Location=1:5
    if Location==1
        subplot(2,2,1)
        title('重庆');ylim([0 250])
    elseif Location ==3
        continue;
    elseif Location ==2
        subplot(2,2,2)
        title('上海');ylim([0 250])
    elseif Location==4
        subplot(2,2,3)
        title('拉萨');ylim([0 250])
    elseif Location==5
        subplot(2,2,4)
        title('海洋');ylim([0 250])
    end
% Location=4;

% figure
hold on
for SSita=22:45:61%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
guijiMH=170/250*100;
guijiL=0;%轨迹路程
guijiE=150;%轨迹剩下的
guijiU=15.4-20;%轨迹用的
f=15*10^6;
% for SSita=10:10:50%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% SSita=60;
Sita=SSita/180*pi;
x=0;y=0;
ex=0;ey=0;
for guiji=1:10
    guiji
    clearvars -EXCEPT Out1 Out guiji guijiL guijiMH guijiE guijiU ...
        f sita x y Sita ex ey Location SSita res
    x=ex+guijiMH/tan(Sita);
    y=ey+guijiMH;
    guijiL=guijiL+sqrt((guijiMH/tan(Sita))^2+(guijiMH)^2);
%     plot((ex:x),(ey:y));
    line([ex x],[ey y]);
    if 32.45+20*log10(guijiL)+20*log10(f/10^6)+guijiU>=guijiE
        break;
    end
    ex=x;ey=y;
O=Out;
SumE=0;
Slen=0;SlenX=0;
sizeO1=size(O,1);
x=ex;y=ey;
sita=Sita;
O_(1,:)=[x y];
back=0;
%test_sita
%test_n
Te=1.602*10^-19;Tm=9.106*10^-31;Ty=1/36/pi*10^-9;
for i=1:sizeO1-1
    if i==1
        N1=0;s_sita1=sin(pi/2-sita);
        n1=sqrt(1-N1*Te^2/Tm/Ty/( 10^(((sizeO1-i)/sizeO1*6+1)*2) +4*pi^2*f^2  ));
%         n1=sqrt(1-80.8*N1/f^2);
    else
        N1=N2;n1=n2;s_sita1=s_sita2;
    end
    N2=10^(O(i,1));
    
    n2=sqrt(1-N2*Te^2/Tm/Ty/( 10^(((sizeO1-i)/sizeO1*6+1)*2) +4*pi^2*f^2  ));
%     n2=sqrt(1-80.8*N2/f^2);
    s_sita2=s_sita1*n1/n2;
    h=O(i+1,2)-O(i,2);
    O_(i+1,1)=h/sqrt(1-s_sita1^2)*s_sita1+O_(i,1);
    O_(i+1,2)=O(i+1,2);
    test_sita(i)=s_sita1;
    test_n(i)=n1;
    SumE=SumE+60*pi*(1-n2^2)* Ty*(10^((sizeO1-i)/sizeO1*6+1)) /n2 * h/sqrt(1-s_sita2^2);
    Slen=Slen+h/sqrt(1-s_sita2^2);
    SlenX=SlenX+h/sqrt(1-s_sita2^2)*s_sita2;
    if s_sita2>=0.9999
        back=1;
        break;
    end
end
if back==1
   len=size(O_,1);
   max_x=max(O_(:,1));
   min_x=min(O_(i,1));
   for  i=1:len
       O_(i+len,1)=2*max_x-O_(len+1-i,1);
       O_(i+len,2)=O_(len+1-i,2);
   end
end
% figure
plot(O_(:,1),O_(:,2),'r');
% xlim([0 1000]);ylim([0 1000]);
% figure
% plot(test_sita);title('test_sita');
% figure
% plot(test_n);title('test_n');
guijiU=guijiU+real(exp(-1*SumE*2));
guijiL=guijiL+real(Slen*2);
ex=ex+real(SlenX*2);
ey=guijiMH;
if 32.45+20*log10(guijiL)+20*log10(f/10^6)+guijiU>=guijiE
        break;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x=ex+guijiMH/tan(Sita);
    y=ey-guijiMH;
    guijiL=guijiL+sqrt((guijiMH/tan(Sita))^2+(guijiMH)^2);
%     plot((ex:x),(ey:-1:y));
    line([ex x],[ey y]);
if 32.45+20*log10(guijiL)+20*log10(f/10^6)+guijiU>=guijiE
        break;
end
ex=x;
ey=y;

%%%%%%%%%%%%%%%%%%%%%%%
if Location==1
    guijiU=guijiU+allDituAll(1,SSita);
elseif Location==2
    guijiU=guijiU+allDituAll(2,SSita);
elseif Location==3
    guijiU=guijiU+allDituAll(3,SSita);
elseif Location==4
    guijiU=guijiU+allDituAll(4,SSita);
elseif Location==5
    guijiU=guijiU+allLang(SSita);
end   
if 32.45+20*log10(guijiL)+20*log10(f/10^6)+guijiU>=guijiE
        break;
end
ex=x;
ey=y;


end
clc
% [ex 32.45+20*log10(guijiL)+20*log10(f)+guijiU]

end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5


res(Location,:)=[guiji ex 32.45+20*log10(guijiL)+20*log10(f/10^6)+guijiU]
end

    





