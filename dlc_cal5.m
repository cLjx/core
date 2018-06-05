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

clearvars -EXCEPT Ou Ou1
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
clearvars -EXCEPT Out1 Out
% figure
% hold on
% plot(Out(:,1),Out(:,2));
% plot(Out1(:,1),Out1(:,2));
% ylim([0 430]);
% xlim([8 13.4]);
% title('fig');
% grid on
simulate_data=[5 60;10 60;15 60;20 40;25 30];
OutData=[];
figure
% simulate_all_fig_data=[];
% legend('5M 60°','10M 60°','15M 60°','20M 40°','25M 30°');
for simulate_i=1:5
clearvars -EXCEPT Out1 Out simulate_i simulate_data OutData ...
    simulate_1_fig simulate_2_fig simulate_3_fig simulate_4_fig ...
    simulate_5_fig simulate_all_fig_data
    simulate_sita=simulate_data(simulate_i,2)/180*pi;
    simulate_f=simulate_data(simulate_i,1);

O=Out;
SumE=0;
Slen=0;SlenX=0;
%add middle data   -----------------------------
% tempO=O;
% clear O;
% tempI=1;
% for i=1:size(tempO,1)-1
%     O(tempI,:)=tempO(i,:);tempI=tempI+1;
%     O(tempI,:)=tempO(i,:)+(tempO(i+1,:)-tempO(i,:))/4*1;tempI=tempI+1;
%     O(tempI,:)=tempO(i,:)+(tempO(i+1,:)-tempO(i,:))/4*2;tempI=tempI+1;
%     O(tempI,:)=tempO(i,:)+(tempO(i+1,:)-tempO(i,:))/4*3;tempI=tempI+1;
% end
% O(tempI,:)=tempO(i,:);tempI=tempI+1;
% plot(O(:,1),O(:,2));
% ylim([0 430]);
% xlim([8 13.4]);
%add middle data end -----------------------------
sizeO1=size(O,1);
sita=simulate_sita;f=simulate_f*10^6;
x=0;y=170/250*100;
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
hold on
plot(O_(:,1),O_(:,2));
simulate_all_fig_data(:,:,simulate_i)=[O_(1:250:end,1),O_(1:250:end,2)];
% if simulate_i==1
%     simulate_1_fig=plot(O_(1:250:end,1),O_(1:250:end,2),'.');
% elseif simulate_i==2
%     simulate_2_fig=plot(O_(1:250:end,1),O_(1:250:end,2),'.');
% elseif simulate_i==3
%     simulate_3_fig=plot(O_(1:250:end,1),O_(1:250:end,2),'.');
% elseif  simulate_i==4
%     simulate_4_fig=plot(O_(1:250:end,1),O_(1:250:end,2),'.');    
% elseif simulate_i==5
%     simulate_5_fig=plot(O_(1:250:end,1),O_(1:250:end,2),'.'); 
% end

% xlim([0 1000]);ylim([0 1000]);
% figure
% plot(test_sita);title('test_sita');
% figure
% plot(test_n);title('test_n');
OutData=[OutData;real(exp(-1*SumE*2)) real(Slen*2) real(SlenX*2)];
% SlenX=real(SlenX*2)
end
hold on
for i=1:5
    plot(simulate_all_fig_data(:,1,i),simulate_all_fig_data(:,2,i),'.');
end
legend('5M 60°','10M 60°','15M 60°','20M 40°','25M 30°');
legend('5M 60°','10M 60°','15M 60°','20M 40°','25M 30°');
xlabel(' /km')
ylabel('h/km')
OutData

% [leg1 objh1]=legend(simulate_1_fig,'5M 60°');
% copyobj(leg1,gcf);
% [leg2 obj2]=legend(simulate_2_fig,'10M 60°');
% leg3=legend(simulate_3_fig,'15M 60°');
% leg4=legend(simulate_4_fig,'20M 40°');
% leg5=legend(len4,simulate_5_fig,'25M 30°');

% [leg1 objh1]=legend(simulate_1_fig,'5M 60°');
% copyobj(leg1,gcf);set(leg1,'position',[0.2 0.2 0.5 0.5])
% [leg2 obj2]=legend(simulate_2_fig,'10M 60°');
% copyobj(leg2,gcf);set(leg2,'position',[0.4 0.4 0.9 0.9])
% [leg3 obj3]=legend(simulate_3_fig,'15M 60°');
% copyobj(leg3,gcf);
% [leg4 obj4]=legend(simulate_4_fig,'20M 40°');
% copyobj(leg4,gcf);
% [leg5 obj5]=legend(simulate_5_fig,'25M 30°');
