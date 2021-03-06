function [ RATCH ] = CHEBISH( COVS,HOURLT,ABMLAT,SG )
%CHEBISH CHEBISHEV POLINOMIALS FOR ABMLAT,HOURLT
%	  
%	SUBROUTINE CHEBISH(COVS,HOURLT,ABMLAT,RATCH,SG)
%-------------------------------------------------------------------------------
% CHEBISHEV POLINOMIALS FOR ABMLAT(10),HOURLT(5)
% CR((C0...C5),(LT=0,6,...24),(SG=season grids=90,180,270,360)
%							(COV=60,106,152,198)
%-------------------------------------------------------------------------------

%      REAL UK(0:10),CR(0:5,5,3,4),YI(5),YY(5,3)
%      REAL BR(6,5,3,4),YI(5),YY(5,3)
%      REAL PL1(5),PL2(5),PL3(5),CL(0:3)
%
  persistent rad PL1 PL2 PL3 BR NI NJ NK NL;
  if isempty(rad)
	  rad = IRI2012.UMR;
    PL1 = [-2.,-1., 0., 1., 2.];
  	PL2 = [ 2.,-1.,-2.,-1., 2.];
  	PL3 = [-1., 2., 0.,-2., 1.];
% Polinomial Coefficients B1,B2,B3,B4,B5,B6 for COV=60 (mlat/10=0,1,...,9)
% Equinox	B0MLAT:
    B0MLAT = [ -1.5859,  3.5789, -3.7884, 2.7094,-1.2962,.6759 ...
      , -5.3449, 12.8379,-12.0165, 5.9746,-1.9084,.7669 ...
      ,-12.8000, 35.3084,-38.0043,19.6004,-4.4974,.6975 ...
      ,  5.8282,-13.3538,  9.1674,-0.9593,-0.8909,.6062 ...
      , -1.5859,  3.5789, -3.7884, 2.7094,-1.2962,.6759 ...
 ...% Summer	B0MLAT    
      , -7.1103, 21.0389,-24.5539,14.1607,-3.8537,.7266 ...
      ,  5.5333,-10.6242,  4.8751, 1.0587,-1.0821,.7527 ...
      ,-15.4487, 42.9269,-45.0314,21.4718,-4.2116,.6026 ...
      , -6.6436, 16.4533,-15.5142, 6.8287,-1.2871,.4976 ...
      , -7.1103, 21.0389,-24.5539,14.1607,-3.8537,.7266 ...
 ...% Winter   B0MLAT                                                                       
      , 14.9103,-35.2337, 27.3078,-6.5362,-0.6265,.7509 ...
      ,  2.3846, -5.8840,  3.7023, 0.8525,-1.2663,.7086 ...
      , -9.8846, 26.6649,-27.0173,12.6959,-2.6536,.6295 ...
      ,  1.7692, -2.3578, -0.7945, 2.2477,-0.9691,.5719 ...
      , 14.9103,-35.2337, 27.3078,-6.5362,-0.6265,.7509];
% Polinomial Coefficients B1,B2,B3,B4,B5,B6 for COV=106 (mlat=0,10,...,90)
% Equinox	B1MLAT
    B1MLAT = [ -4.1218, 10.6136,-11.4922, 6.0470,-1.3620,.5563 ...
      ,  0.9077,  2.9562, -8.9880, 6.8680,-1.9621,.7737 ...
      ,-16.2744, 42.8047,-43.7009,20.7965,-4.0697,.6619 ...
      ,-17.3038, 44.3336,-40.9249,15.9042,-2.1554,.4796 ...
      , -4.1218, 10.6136,-11.4922, 6.0470,-1.3620,.5563 ...
 ...% Summer	B1MLAT  
      , -4.9692, 16.5753,-21.3543,12.7061,-3.1758,.6446 ...
      ,  1.9000, -2.8167, -0.9962, 3.0687,-1.3454,.6859 ...
      ,  7.6769,-14.8343,  6.7030, 1.5578,-1.0626,.4291 ...
      ,  5.4833,-10.6322,  4.7571, 1.2178,-0.8223,.4615 ...
      , -4.9692, 16.5753,-21.3543,12.7061,-3.1758,.6446 ...
 ...% Winter	B1MLAT  
      , -4.7282, 13.4491,-15.6931, 8.8388,-1.9732,.5874 ...
      ,  5.6756,-14.8458, 11.8927,-2.2632,-0.6122,.6948 ...
      ,-14.2872, 40.0829,-41.2716,18.1696,-2.7203,.4916 ...
      ,-13.6128, 33.4657,-29.7231,11.0972,-1.2884,.5034 ...
      , -4.7282, 13.4491,-15.6931, 8.8388,-1.9732,.5874];
% Polinomial Coefficients B1,B2,B3,B4,B5,B6 for COV=152 (mlat=0,10,...,90)
% Equinox	B2MLAT
    B2MLAT = [ -3.3282, 10.4296,-12.4722, 6.7623,-1.5172,.4931 ...
      , -8.9744, 20.1311,-17.4552, 7.6518,-1.7371,.6702 ...
      , 12.0462,-27.8932, 20.6241,-4.5781, 0.0814,.3501 ...
      ,-17.0551, 42.3258,-37.1874,13.3608,-1.4804,.4216 ...
      , -3.3282, 10.4296,-12.4722, 6.7623,-1.5172,.4931 ...
 ...% Summer	B2MLAT  
      ,  7.3077,-17.1579, 11.6872,-0.7405,-1.0298,.5754 ...
      , 19.2641,-45.1886, 34.3297,-8.1879,-0.1875,.6562 ...
      ,  6.0987,-11.0903,  4.3569, 1.4001,-0.7309,.3885 ...
      ,  5.9295,-13.9205, 10.2347,-2.2818, 0.0853,.3915 ...
      ,  7.3077,-17.1579, 11.6872,-0.7405,-1.0298,.5754 ...
 ...% Winter	B2MLAT  
      , -1.6821,  8.6010,-13.6570, 8.6307,-1.9846,.5635 ...
      ,  5.4679,-12.3750,  7.5620, 0.5394,-1.4415,.6659 ...
      , -8.0821, 21.9288,-21.8597, 9.3455,-1.4644,.3599 ...
      , -8.3000, 19.3076,-16.3295, 6.1619,-0.9144,.3846 ...
      , -1.6821,  8.6010,-13.6570, 8.6307,-1.9846,.5635];
% Polinomial Coefficients B1,B2,B3,B4,B5,B6 for COV=198 (mlat=0,10,...,90)
% Equinox	B3MLAT
    B3MLAT = [-16.4051, 28.2880,-16.0982, 4.6328,-1.0405,.5486 ...
      , 13.0846,-34.8291, 30.0074,-8.6402, 0.1529,.6165 ...
      , 19.7474,-42.7116, 28.9430,-6.0487, 0.1492,.3748 ...
      , 16.2795,-36.6982, 26.5094,-6.3492, 0.2926,.3946 ...
      ,-16.4051, 28.2880,-16.0982, 4.6328,-1.0405,.5486 ...
 ...% Summer	B3MLAT
      ,  4.6410,-13.7931, 11.6548,-1.9248,-0.7246,.5264 ...
      , -2.4090,  3.1805, -2.8423, 2.8861,-0.9937,.5234 ...
      ,  6.3410,-13.9643,  8.2461,-0.0186,-0.7009,.3582 ...
      ,  9.0987,-20.8618, 14.7262,-2.8798,-0.0512,.3662 ...
      ,  4.6410,-13.7931, 11.6548,-1.9248,-0.7246,.5264 ...
 ...% Winter	B3MLAT
      , -4.6526, 12.1878,-14.4047, 8.5226,-2.0493,.5903 ...
      ,  3.9821, -6.9477,  0.8382, 3.4898,-1.5694,.6283 ...
      , -7.0474, 17.3974,-17.3465, 8.3671,-1.5708,.3759 ...
      ,  4.2782, -9.9880,  5.9834, 0.0975,-0.4900,.3842 ...
      , -4.6526, 12.1878,-14.4047, 8.5226,-2.0493,.5903];
    NI = 6;
    NJ = 5;
    NK = 3;
    NL = 4;
    BR = zeros(NI,NJ,NK,NL);
    KK = 1;
    for K=1:NK
      for J=1:NJ
        for I=1:NI
          BR(I,J,K,1) = B0MLAT(KK);
          BR(I,J,K,2) = B1MLAT(KK);
          BR(I,J,K,3) = B2MLAT(KK);
          BR(I,J,K,4) = B3MLAT(KK);
          KK = KK + 1;
        end
      end
    end

%	DATA UL/-2.,-1.,0.,1.,2./
  end
  CL = zeros(4,1);
  YI = zeros(NJ,1);
  YY = zeros(NJ,NK);

	IR=floor((COVS-60.)/46.)+1;
  % Given geomagnetic latitude parameter:
	xi=ABMLAT/100.;
	for LS=1:NK
    for LL=1:NJ
      B1=BR(6,LL,LS,IR);
      B2=BR(5,LL,LS,IR);
      B3=BR(4,LL,LS,IR);
      B4=BR(3,LL,LS,IR);
      B5=BR(2,LL,LS,IR);
      B6=BR(1,LL,LS,IR);
      %HLT=(LL-1)*6.0;

      YY(LL,LS)=B1+xi*(B2+xi*(B3+xi*(B4+xi*(B5+xi*B6))));
    end
  end            % end of season/day cycle
  % Apply seasonal interpolation
	for i=1:NJ
    p0=(2.*YY(i,1)+YY(i,2)+YY(i,3))/4.;
    p1=(YY(i,3)-YY(i,2))/2.;
    p2=(YY(i,2)+YY(i,3)-2.*YY(i,1))/4.;
    YI(i)=p0+p1*cos(SG*rad)+p2*cos(2.*SG*rad);
  end
  for K=1:NJ
    CL(0+1)=CL(0+1)+YI(K);
    CL(1+1)=CL(1+1)+YI(K)*PL1(K);
    CL(2+1)=CL(2+1)+YI(K)*PL2(K);
    CL(3+1)=CL(3+1)+YI(K)*PL3(K);
  end
  CL(0+1)=CL(0+1)/5.;
  CL(1+1)=CL(1+1)/10.;
  CL(2+1)=CL(2+1)/14.;
  CL(3+1)=CL(3+1)/12.;
  ULL=(HOURLT-12.)/6.;
  ZA=CL(0+1)-2.*CL(2+1);
  RATCH=ZA+ULL*(CL(1+1)-3.4*CL(3+1)+ULL*(CL(2+1)+ULL*CL(3+1)));


end

