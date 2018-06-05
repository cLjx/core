function return_lose=allDituAll(get_Location,get_Jiaodu)
% get_Location=1;get_Jiaodu=45;
plot1=[];
plot2=[];
plot3=[];
plot4=[];
% % % hold on
% % % grid on
%% 1
clearvars -EXCEPT plot1 plot2 plot3 plot4 ...
    get_Location get_Jiaodu return_lose
load('dituZ1.mat');
zz=dituZ1;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT  plot1 plot2 plot3 plot4 ...
    testOk_ testAll_ theta zz zzz ...
    get_Location get_Jiaodu return_lose
% theta
% testerr1=0;
% testerr2=0;
theta=theta/180*pi;
testAll=0;
testOk=0;
LENGTH=0.05/180*pi*6371000/22;
Zsize=size(zz,1);
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
zz=zzz;
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end


% testerr1/testerr2
% testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot1=(testOk_./testAll_);
% % % plot(-10*log(plot1))
%% 2
clearvars -EXCEPT plot1 plot2 plot3 plot4 ...
    get_Location get_Jiaodu return_lose
load('dituZ2.mat');
zz=dituZ2;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT  plot1 plot2 plot3 plot4 ...
     testOk_ testAll_ theta zz zzz ...
    get_Location get_Jiaodu return_lose
% theta
% testerr1=0;
% testerr2=0;
theta=theta/180*pi;
testAll=0;
testOk=0;
LENGTH=0.05/180*pi*6371000/22;
Zsize=size(zz,1);
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
zz=zzz;
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end


% testerr1/testerr2
% testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot2=(testOk_./testAll_);
% % plot(-10*log(plot2))
%% 3
clearvars -EXCEPT plot1 plot2 plot3 plot4 ...
    get_Location get_Jiaodu return_lose
load('dituZ3.mat');
zz=dituZ3;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT  plot1 plot2 plot3 plot4 ...
     testOk_ testAll_ theta zz zzz ...
    get_Location get_Jiaodu return_lose
% theta
% testerr1=0;
% testerr2=0;
theta=theta/180*pi;
testAll=0;
testOk=0;
LENGTH=0.05/180*pi*6371000/22;
Zsize=size(zz,1);
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
zz=zzz;
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end


% testerr1/testerr2
% testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot3=(testOk_./testAll_);
% % % plot(-10*log(plot3))
%% 4
clearvars -EXCEPT plot1 plot2 plot3 plot4 ...
    get_Location get_Jiaodu return_lose
load('dituZ4.mat');
zz=dituZ4;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT  plot1 plot2 plot3 plot4 ...
     testOk_ testAll_ theta zz zzz ...
    get_Location get_Jiaodu return_lose
% theta
% testerr1=0;
% testerr2=0;
theta=theta/180*pi;
testAll=0;
testOk=0;
LENGTH=0.05/180*pi*6371000/22;
Zsize=size(zz,1);
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
zz=zzz;
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
for i=1:Zsize
    for j=1:Zsize-1
        alpha=abs(atan((zz(i,j+1)-zz(i,j))/LENGTH));
%         testerr2=testerr2+1;
%         if 2*alpha<theta
%             testerr1=testerr1+1;
%         end
        if zz(i,j+1)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)<0 && alpha<theta &&...
                langFun(i,j,0,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i,j+1)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end
% testOk/testAll
for j=1:Zsize
    for i=1:Zsize-1
        alpha=abs(atan((zz(i+1,j)-zz(i,j))/LENGTH));
        if zz(i+1,j)-zz(i,j)>0 && pi/2-2*alpha-theta>0 &&...
                langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)<0 && alpha<theta &&...
            langFun(i,j,1,LENGTH,Zsize,alpha,theta,zz)==1
            testOk=testOk+1;
        elseif zz(i+1,j)-zz(i,j)==0
            testOk=testOk+1;
        end
        testAll=testAll+1;
    end
end


% testerr1/testerr2
% testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot4=(testOk_./testAll_);
% % % plot(-10*log(plot4))
%% ok
% % % legend('重庆','上海','贵阳','拉萨');
% % % xlabel('射线仰角 \Delta /°');
% % % ylabel('附加损耗 /dB');   
% % % grid on
% % % xlim([0 90])
% ylim([00.2 0.65])
%% back
clearvars -EXCEPT plot1 plot2 plot3 plot4 ...
    get_Location get_Jiaodu return_lose
f=15*10^-3;
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
%     theta
f=15*10^6;
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
% plot(Out)
% xlim([0 90])
% xlabel('射线仰角 \Delta /°');
% ylabel('固有损耗 /dB');   
% grid on



if get_Location==1
    return_lose=-10*log(plot1(get_Jiaodu))+Out(get_Jiaodu);
elseif get_Location==2;
    return_lose=-10*log(plot2(get_Jiaodu))+Out(get_Jiaodu);
elseif get_Location==3
    return_lose=-10*log(plot3(get_Jiaodu))+Out(get_Jiaodu);
elseif get_Location==4
    return_lose=-10*log(plot4(get_Jiaodu))+Out(get_Jiaodu);
end




