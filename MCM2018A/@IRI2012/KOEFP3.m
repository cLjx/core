function [ PG3O ] = KOEFP3( )
%KOEFP3 COEFFICIENTS FOR CALCULATING O2+ PROFILES
%
%      SUBROUTINE  KOEFP3(PG3O)                     
% THIEMANN,1979,COEFFICIENTS FOR CALCULATING O2+ PROFILES.                      
% CHOSEN AS TO APPROACH DANILOV-SEMENOV'S COMPILATION.                          

%      DIMENSION PG3O(80)                           
%      REAL FELD(80)
  persistent FELD;
  if isempty(FELD)
    FELD = [-11.0,1.0,2.0,-11.0,160.0,31.0,130.0, ...
      -10.0,198.0,0.0,0.05922,-0.07983, ...
      -0.00397,0.00085,-0.00313,0.0,-11.0,2.0,2.0,-11.0, ...
      140.0,30.0,130.0,-10.0, ...
      190.0,0.0,0.05107,-0.07964,0.00097,-0.01118,-0.02614, ...
      -0.09537, ...
      -11.0,1.0,3.0,-11.0,140.0,37.0,125.0,0.0,182.0, ...
      0.0,0.0307,-0.04968,-0.00248, ...
      -0.02451,-0.00313,0.0,-11.0,2.0,3.0,-11.0, ...
      140.0,37.0,125.0,0.0,170.0,0.0, ...
      0.02806,-0.04716,0.00066,-0.02763,-0.02247,-0.01919, ...
      -11.0,-11.0,4.0,-11.0,140.0,45.0,136.0,-9.0, ...
      181.0,-26.0,0.02994,-0.04879, ...
      -0.01396,0.00089,-0.09929,0.05589];
  end
  PG3O = FELD;

end

