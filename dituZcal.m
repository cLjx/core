clc;clear all
plot1=[];
plot2=[];
plot3=[];
plot4=[];
hold on
grid on
%% 1
clearvars -EXCEPT plot1 plot2 plot3 plot4
load('dituZ1.mat');
zz=dituZ1;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT testOk_ testAll_ theta zz zzz
theta
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
testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot1=(testOk_./testAll_);
plot(-10*log(plot1))
%% 2
clearvars -EXCEPT plot1 plot2 plot3 plot4
load('dituZ2.mat');
zz=dituZ2;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT testOk_ testAll_ theta zz zzz
theta
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
testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot2=(testOk_./testAll_);
plot(-10*log(plot2))
%% 3
clearvars -EXCEPT plot1 plot2 plot3 plot4
load('dituZ3.mat');
zz=dituZ3;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT testOk_ testAll_ theta zz zzz
theta
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
testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot3=(testOk_./testAll_);
plot(-10*log(plot3))
%% 4
clearvars -EXCEPT plot1 plot2 plot3 plot4
load('dituZ4.mat');
zz=dituZ4;
zzz=(fliplr((fliplr(zz))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT testOk_ testAll_ theta zz zzz
theta
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
testOk/testAll
testOk_=[testOk_ testOk];
testAll_=[testAll_ testAll];
end
plot4=(testOk_./testAll_);
plot(-10*log(plot4))
%% ok
legend('ÖØÇì','ÉÏº£','¹óÑô','À­Èø');
xlabel('ÉäÏßÑö½Ç \Delta /¡ã');
ylabel('¸½¼ÓËðºÄ /dB');   
grid on
xlim([0 90])
% ylim([00.2 0.65])



