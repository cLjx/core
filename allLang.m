function resoult_loss=allLang(get_Sita)

load('langZ.mat', 'z');
% z=ones(5);
zz=z;
zzz=(fliplr((fliplr(z))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT testOk_ testAll_ theta zz zzz get_Sita
theta
% testerr1=0;
% testerr2=0;
theta=theta/180*pi;
testAll=0;
testOk=0;
LENGTH=100*pi/30;
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
% plot(-10*log10(testOk_./testAll_))
% xlabel('ÉäÏßÑö½Ç \Delta /¡ã');
% ylabel('¸½¼ÓËðºÄ /dB');   
% grid on
% xlim([0 90])
% ylim([0 5])
%%
before_resoult_loss=-10*log10(testOk_(get_Sita)/testAll_(get_Sita));
load('langZ.mat', 'z');
% z=ones(5);
zz=z;
zzz=(fliplr((fliplr(z))'))';
testOk_=[];
testAll_=[];
for theta=1:1:89
    clc;clearvars -EXCEPT testOk_ testAll_ theta zz zzz ...
        before_resoult_loss  get_Sita
theta
% testerr1=0;
% testerr2=0;
theta=theta/180*pi;
testAll=0;
testOk=0;
LENGTH=100*pi/30;
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
% plot(-10*log10(testOk_./testAll_))
% xlabel('ÉäÏßÑö½Ç \Delta /¡ã');
% ylabel('¸½¼ÓËðºÄ /dB');   
% grid on
% xlim([0 90])
% ylim([0 5])

resoult_loss=before_resoult_loss-10*log10(testOk_(get_Sita)/testAll_(get_Sita));






