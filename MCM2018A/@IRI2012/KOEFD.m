function [ DOUT ] = KOEFD( MIRREQ )
%KOEFD coefficients - main model part
%
%      SUBROUTINE KOEFD(MIRREQ,DOUT)
%-------------------------------------------------------------------------------
%    coefficients - main model part
%-------------------------------------------------------------------------------

%      REAL DOUT(5,3,81)
%      INTEGER MIRREQ(81),I,J,K
%      REAL D(5,3,81)
  persistent D NI NJ NK;
  if isempty(D)
    NI = 5;
    NJ = 3;
    NK = 81;
    data = cell(NI,NJ-1);
    %     350km equinox
    data{1,1} = [ 3.1753E+00, 5.7689E-07, 1.9586E-01, ...
                 -6.8275E-07, 1.8921E-02, 3.6213E-07, ...
                 -1.8628E-02, 5.0105E-08,-8.5600E-03, ...
                 -1.6010E-01,-9.6605E-08,-1.9714E-02, ...
                  2.1637E-07, 4.8494E-03,-3.8884E-07, ...
                 -3.4967E-03, 2.2421E-07, 2.1263E-02, ...
                  9.3647E-08,-7.9466E-03, 1.0780E-07, ...
                  9.0129E-03,-1.2648E-07, 9.2017E-05, ...
                  5.0372E-08,-7.7926E-02,-5.7641E-08, ...
                 -9.1840E-03,-2.8697E-08, 8.4038E-04, ...
                 -3.3483E-09, 9.8633E-04,-3.6580E-02, ...
                  2.6765E-07, 9.6558E-03, 3.1708E-09, ...
                 -3.7801E-04,-1.4056E-08,-7.5288E-04, ...
                  5.8945E-02,-6.4803E-08, 6.6372E-03, ...
                 -5.1910E-08, 6.6456E-05, 5.3576E-09, ...
                 -5.9863E-02,-2.4909E-07,-1.1843E-03, ...
                  4.9602E-08, 2.4969E-04,-7.2411E-09, ...
                  6.1304E-02,-9.0388E-08, 1.4235E-03, ...
                  9.6584E-09, 4.8905E-04, 3.4504E-02, ...
                  3.9764E-08, 2.2885E-04,-2.0067E-08, ...
                 -2.3446E-04,-5.3749E-02, 5.5106E-08, ...
                 -2.5829E-05,-3.6483E-10, 3.9294E-02, ...
                 -1.1888E-07,-1.1182E-04, 8.2427E-09, ...
                 -3.4563E-02,-4.2396E-08,-6.5573E-04, ...
                 -2.7676E-02,-1.3017E-08, 5.8774E-04, ...
                  1.6090E-02, 4.6780E-08,-2.0595E-02, ...
                  2.5706E-08, 1.2541E-02, 1.7794E-02];
    %     350km June solstice
    data{1,2} = [ 3.1629E+00, 6.1302E-02, 2.0063E-01, ...
                  4.5285E-02,-4.1826E-02, 1.9260E-03, ...
                  2.4969E-03, 8.2077E-03,-2.8539E-02, ...
                 -1.6297E-01, 1.3558E-02,-2.4389E-02, ...
                 -3.1286E-03, 2.2763E-02, 2.1271E-03, ...
                 -6.5418E-03, 9.5738E-04, 1.6215E-02, ...
                  1.8507E-03,-1.0563E-03, 1.1742E-03, ...
                 -1.0133E-03,-1.9169E-03, 3.6940E-03, ...
                 -1.5715E-04,-5.6835E-02,-4.2398E-03, ...
                  6.2377E-03,-1.5667E-03, 4.1399E-04, ...
                 -2.1687E-03, 2.0367E-04,-1.4575E-02, ...
                  8.7408E-03,-1.5991E-03, 2.2254E-03, ...
                  1.3953E-03,-6.9929E-04,-1.0188E-03, ...
                  2.6039E-02,-7.4757E-04, 2.1545E-03, ...
                  1.0206E-03, 9.9516E-05,-5.1330E-04, ...
                 -4.3098E-03, 6.8083E-04, 1.7507E-03, ...
                  1.8198E-03,-5.2904E-04,-5.0768E-04, ...
                  3.1658E-02, 4.7564E-03,-9.2531E-04, ...
                  1.7889E-03,-3.7194E-05, 1.6896E-02, ...
                 -5.0829E-04,-8.1960E-04, 4.8322E-04, ...
                 -2.6520E-05,-1.0728E-02, 4.1619E-03, ...
                  3.8523E-04, 4.9239E-05, 1.1805E-02, ...
                 -2.9327E-03, 2.9543E-04, 2.9735E-04, ...
                 -9.7455E-03,-1.6474E-03, 1.0511E-03, ...
                 -1.7878E-02, 5.3427E-03, 1.7965E-05, ...
                  3.5806E-03, 6.6563E-04,-1.2012E-02, ...
                 -5.7183E-03, 2.4944E-03, 4.3333E-03];
    %     550km equinox
    data{2,1} = [ 3.2751E+00, 1.3545E-06, 1.7150E-01, ...
                 -7.6203E-07, 4.0429E-02, 5.0117E-07, ...
                 -2.2589E-02, 3.0332E-08,-2.0861E-02, ...
                 -1.4168E-01, 2.7793E-07,-1.8331E-02, ...
                  2.2669E-07, 4.6414E-03, 6.9158E-08, ...
                  1.3312E-03,-1.0690E-07, 1.7280E-02, ...
                  3.6689E-07,-1.0921E-03,-4.8798E-07, ...
                  2.0699E-03, 1.5270E-07, 4.0919E-03, ...
                 -4.0587E-08,-8.4276E-02,-1.8326E-07, ...
                 -7.7966E-03, 2.9950E-07, 1.3969E-03, ...
                  2.2649E-08, 1.0082E-03,-3.1392E-02, ...
                 -5.0450E-08, 1.7356E-03,-1.4810E-08, ...
                  2.4669E-03, 2.0049E-08,-1.6503E-04, ...
                  5.6435E-02,-2.2274E-07, 4.4061E-03, ...
                 -1.8825E-08, 3.1341E-04, 1.3638E-08, ...
                 -4.7964E-02,-3.1192E-07,-3.8772E-04, ...
                  2.2998E-08,-5.8125E-05, 1.5519E-09, ...
                  4.9958E-02, 7.1110E-08, 1.6467E-03, ...
                 -3.5644E-08, 1.8249E-04, 2.7835E-02, ...
                 -1.2413E-07,-1.5793E-03, 2.2114E-08, ...
                 -3.9754E-04,-2.2227E-02, 2.2094E-07, ...
                  2.8621E-04, 5.3520E-09, 1.9280E-02, ...
                  5.1741E-08, 3.2861E-04,-1.7477E-08, ...
                 -1.9664E-02,-6.0668E-08,-3.8234E-05, ...
                 -1.8001E-02, 1.3656E-07, 4.1525E-04, ...
                  7.9458E-03,-1.0954E-07,-1.2869E-02, ...
                 -6.1937E-08, 9.2866E-03, 5.3834E-03];
    %     550km June solstice
    data{2,2} = [ 3.2706E+00, 3.5202E-02, 1.6153E-01, ...
                  7.5517E-02,-1.2975E-02,-1.0202E-02, ...
                 -1.4402E-02, 8.0992E-03,-2.4350E-02, ...
                 -1.5168E-01, 2.1369E-02,-1.2387E-02, ...
                 -6.1981E-03, 9.1958E-03, 2.4677E-03, ...
                 -4.9595E-04,-9.1671E-04, 1.1726E-02, ...
                  1.3928E-04,-6.8449E-03, 3.9822E-03, ...
                  6.7074E-03,-2.3986E-03, 9.3211E-04, ...
                 -1.2521E-03,-7.7734E-02, 5.3710E-03, ...
                  3.3728E-04,-6.9879E-04, 1.9755E-03, ...
                 -2.3413E-04, 7.7060E-04,-2.7894E-02, ...
                  1.2731E-02, 1.9542E-03, 2.6609E-03, ...
                 -3.5695E-04,-1.1310E-03,-6.4754E-04, ...
                  4.2322E-02,-6.9529E-03,-7.8122E-04, ...
                  1.9300E-05,-6.5241E-04,-2.0369E-05, ...
                 -3.0919E-02, 1.4165E-03, 1.9683E-03, ...
                  3.6586E-05, 2.3327E-04, 7.7364E-05, ...
                  3.6784E-02, 2.2045E-03, 2.1286E-04, ...
                  6.5019E-04, 1.3530E-04, 1.2010E-02, ...
                 -1.1533E-03,-1.0365E-03, 5.2595E-04, ...
                 -1.9816E-04,-6.4129E-03,-2.9187E-04, ...
                  6.4120E-04,-4.3814E-04, 1.9807E-02, ...
                 -1.7670E-03,-5.2232E-04,-2.5243E-05, ...
                 -1.4894E-02, 7.9595E-04, 1.8406E-04, ...
                  9.1260E-04, 5.9450E-04, 3.9428E-04, ...
                  1.7175E-03,-7.0834E-04,-7.3342E-03, ...
                  9.3208E-04, 8.0461E-03, 1.7211E-03];
    %     850km equinox
    data{3,1} = [ 3.4090E+00,-8.7890E-07, 1.4192E-01, ...
                  2.2022E-06,-2.3026E-02, 2.8080E-07, ...
                 -2.0490E-02,-2.4588E-06, 8.0287E-03, ...
                 -1.7872E-01,-5.9833E-07,-3.1967E-03, ...
                  5.7087E-07, 5.6724E-03,-3.6116E-08, ...
                 -3.9539E-03,-1.1406E-07, 2.5913E-02, ...
                 -4.3955E-07,-5.9265E-03, 3.8624E-07, ...
                  4.3640E-03,-2.1767E-07,-1.6975E-03, ...
                  1.4715E-08,-6.7945E-02, 6.7140E-07, ...
                 -5.8461E-03, 1.1914E-07, 2.4496E-04, ...
                 -4.9921E-08,-3.8830E-04,-1.2488E-02, ...
                 -3.9557E-07, 9.4377E-04, 1.5100E-07, ...
                  4.1863E-04,-2.6552E-08,-9.4832E-04, ...
                  3.7187E-02, 7.8305E-07,-3.6193E-03, ...
                  1.9130E-07,-5.5284E-04,-7.0234E-08, ...
                 -1.1616E-02, 7.5494E-08, 1.4075E-03, ...
                  7.9285E-08, 3.1501E-04,-3.4879E-08, ...
                  3.8138E-02, 4.5561E-07,-5.2993E-06, ...
                  7.2506E-08,-4.6427E-04, 1.1952E-02, ...
                  1.9508E-07,-7.3901E-04, 1.6083E-08, ...
                  4.6821E-04, 2.2138E-03, 1.9836E-08, ...
                  9.1512E-05, 2.5883E-10, 1.6160E-02, ...
                  9.8914E-08, 2.2891E-04, 3.5686E-08, ...
                 -2.3945E-02,-9.7206E-08, 4.1304E-04, ...
                 -1.1323E-02,-1.0595E-07, 2.4607E-06, ...
                 -1.1919E-02,-1.2954E-07,-1.5160E-02, ...
                 -9.8974E-08, 9.1103E-03,-9.8102E-04];
    %     850km June solstice
    data{3,2} = [ 3.4298E+00, 2.6491E-02, 1.3842E-01, ...
                  4.0680E-02,-5.6606E-02,-5.7153E-03, ...
                 -1.4690E-02, 7.5677E-03, 3.2216E-04, ...
                 -1.8092E-01, 1.2032E-02, 8.3830E-03, ...
                 -1.6994E-03, 7.3073E-03, 4.6493E-03, ...
                 -5.9776E-03,-1.0911E-03, 1.8614E-02, ...
                 -6.0207E-03,-4.0287E-03,-2.4354E-03, ...
                  3.2668E-03, 2.0486E-03,-2.4568E-03, ...
                  1.7932E-04,-7.2842E-02, 1.2262E-03, ...
                 -2.4092E-03, 2.1826E-03, 1.1999E-03, ...
                 -5.7385E-04,-7.9356E-04,-4.8885E-03, ...
                  6.0397E-03, 1.5036E-03,-6.6850E-04, ...
                 -1.5557E-03, 7.0217E-04,-6.6930E-04, ...
                  2.7146E-02,-1.7554E-04,-5.7637E-03, ...
                 -4.8048E-05, 1.7230E-04, 2.7707E-04, ...
                 -1.8722E-02,-2.5534E-03, 2.7433E-03, ...
                 -9.4675E-04, 3.5885E-04, 1.6066E-04, ...
                  4.7142E-02,-3.8642E-03,-1.8094E-03, ...
                  3.7500E-04,-8.2361E-05, 3.4841E-04, ...
                 -2.1525E-03,-1.6265E-03,-5.6589E-04, ...
                  3.9127E-04, 2.3966E-02, 5.8480E-04, ...
                  1.1863E-05,-4.6920E-04,-3.2951E-03, ...
                 -1.3868E-03,-3.2869E-04,-4.1003E-05, ...
                 -8.5024E-03, 6.8306E-04, 1.2730E-03, ...
                  3.5803E-03,-6.7022E-05,-9.2460E-04, ...
                 -5.0650E-03, 2.3747E-03,-1.1690E-02, ...
                  2.7210E-04,-1.2308E-02,-2.4554E-03];
    %     1400km equinox
    data{4,1} = [ 3.4323E+00, 5.9891E-08, 1.4440E-01, ...
                 -2.5296E-06,-3.0483E-02, 8.7633E-07, ...
                 -2.0333E-02, 1.4639E-06, 8.3905E-03, ...
                 -2.4661E-01,-3.3357E-07, 2.3371E-02, ...
                 -2.6009E-07, 7.4049E-03,-4.2111E-07, ...
                 -4.0153E-03, 3.2564E-07,-3.3975E-02, ...
                 -3.1496E-07, 5.0539E-04,-2.1844E-07, ...
                  6.6046E-03, 3.7777E-07, 1.0884E-03, ...
                 -1.7690E-07,-9.7080E-02,-1.0183E-06, ...
                  3.2316E-04, 2.3879E-07, 1.0714E-03, ...
                 -1.5921E-07,-2.2353E-04,-7.8730E-02, ...
                 -4.9271E-07,-3.3524E-03,-9.7695E-08, ...
                  4.0369E-06, 9.1746E-08, 4.3697E-04, ...
                  5.4799E-02,-1.5613E-06, 2.0376E-05, ...
                  1.5198E-07, 5.2388E-05,-4.3276E-08, ...
                 -1.9427E-02,-4.8251E-07,-3.6941E-03, ...
                  1.0404E-08,-3.8792E-04, 1.9478E-08, ...
                  2.7545E-02,-7.9193E-07, 1.9158E-05, ...
                 -3.8582E-08, 4.3319E-06, 2.1105E-02, ...
                  5.6969E-08,-1.4642E-03, 1.7346E-08, ...
                 -2.0981E-04,-1.6940E-02,-3.2828E-07, ...
                  9.3221E-04,-5.8952E-08, 2.2700E-02, ...
                  8.6772E-07,-3.0788E-04,-3.1938E-08, ...
                 -3.5342E-02,-4.1651E-08,-4.6744E-04, ...
                  3.2506E-03, 9.8322E-07, 2.4373E-04, ...
                  1.0563E-02,-4.2559E-08,-1.4966E-02, ...
                  6.3242E-07, 3.0936E-02, 5.0785E-04];
    %     1400km June solstice
    data{4,2} = [ 3.4432E+00, 1.4031E-02, 1.3160E-01, ...
                  2.5090E-02,-4.2982E-02,-4.1350E-03, ...
                 -2.3576E-02, 4.5813E-04, 9.9480E-03, ...
                 -2.4132E-01, 3.9410E-03, 2.5328E-02, ...
                  2.5753E-03, 4.7467E-03, 2.4033E-03, ...
                 -4.5280E-03,-1.6768E-03,-2.4686E-02, ...
                  1.3680E-03, 4.5365E-03,-2.2588E-04, ...
                  4.7237E-03,-3.4808E-03, 1.9872E-03, ...
                  2.0111E-05,-1.0665E-01, 1.2940E-03, ...
                  5.1466E-04, 1.1414E-03,-2.6179E-04, ...
                  1.6622E-03,-2.9043E-04,-4.1638E-02, ...
                  2.5988E-03, 2.4967E-03, 1.1947E-03, ...
                  9.8563E-04,-1.1244E-03, 4.6249E-04, ...
                  2.2485E-02,-1.8404E-03,-2.7030E-03, ...
                 -5.6671E-04, 6.2775E-05, 2.3428E-04, ...
                 -1.9091E-02, 3.9310E-03,-1.3812E-03, ...
                  6.2219E-04, 4.0298E-04,-2.5167E-04, ...
                  3.6186E-02,-1.6894E-03,-9.2292E-04, ...
                 -3.5095E-04,-1.6027E-05, 5.0279E-03, ...
                  1.6496E-03,-1.2996E-03, 1.0942E-04, ...
                 -8.8813E-05,-9.8253E-04, 6.0205E-05, ...
                  3.1574E-04,-2.5650E-04, 1.6418E-02, ...
                 -7.4029E-04, 8.5019E-05, 7.1348E-05, ...
                 -8.8478E-03, 7.9330E-04, 4.9878E-04, ...
                  6.8566E-03,-1.3812E-03, 3.7630E-04, ...
                 -4.2406E-04,-4.0773E-05,-7.0264E-03, ...
                 -4.8997E-04, 3.2745E-03,-4.3985E-03];
    %     2000km equinox
    data{5,1} = [ 3.5267E+00, 3.1496E-06, 1.0072E-01, ...
                 -4.0719E-06,-2.9570E-02, 3.1967E-06, ...
                 -1.6759E-02,-2.2291E-06, 1.4529E-02, ...
                 -2.0303E-01, 2.6118E-06, 2.3639E-02, ...
                 -1.5963E-06, 2.8544E-03, 6.3910E-07, ...
                 -6.4201E-03,-1.4241E-07,-2.2074E-02, ...
                  1.3024E-07,-6.5225E-04,-7.5969E-09, ...
                  6.8229E-03,-1.1600E-08, 6.5430E-04, ...
                 -3.1299E-09,-8.9155E-02, 1.0420E-06, ...
                  2.2701E-04,-2.8037E-07, 7.6229E-05, ...
                  9.0789E-08,-8.3574E-04,-4.3006E-02, ...
                  9.5987E-08,-2.5486E-03, 1.2764E-08, ...
                  1.6634E-03,-9.8076E-09,-2.0750E-05, ...
                  4.1638E-02, 1.2831E-07, 3.2205E-03, ...
                 -7.2843E-08, 4.7908E-04, 1.0592E-09, ...
                 -8.8335E-03,-8.6869E-08,-2.5895E-03, ...
                  8.5979E-09, 8.1594E-04, 4.8263E-09, ...
                  4.4205E-02,-4.5836E-08, 2.4211E-03, ...
                 -1.7175E-08, 1.3454E-04, 2.9288E-02, ...
                 -6.4336E-08,-4.7940E-04,-1.7677E-08, ...
                  2.7104E-04, 3.8585E-03,-1.9495E-08, ...
                  9.5007E-04, 1.4881E-10, 3.5952E-02, ...
                  1.2439E-07,-2.6259E-04,-3.3433E-08, ...
                 -4.5002E-03,-9.7622E-08, 1.0627E-04, ...
                  1.7064E-02, 2.6949E-07, 3.5386E-05, ...
                  1.3508E-03,-9.3600E-08, 2.2163E-03, ...
                  1.8302E-07, 1.4533E-02, 6.8208E-03];
    %     2000km June solstice
    data{5,2} = [ 3.5455E+00, 2.3030E-02, 9.1028E-02, ...
                  5.6686E-03,-4.3555E-02, 7.5223E-03, ...
                 -5.3314E-03,-2.3664E-03, 9.2735E-03, ...
                 -1.7562E-01, 6.8722E-03, 2.6142E-02, ...
                 -7.5933E-03,-2.6850E-03, 1.5072E-03, ...
                 -3.8334E-03,-1.8455E-03,-8.3019E-03, ...
                 -3.1750E-03,-3.4582E-03,-3.0116E-03, ...
                  6.4951E-03,-1.9833E-04, 1.9620E-03, ...
                 -1.6688E-03,-9.1850E-02, 2.8064E-03, ...
                  1.1347E-03, 5.5757E-04,-1.7941E-03, ...
                  4.4038E-04,-7.6030E-04,-1.7519E-02, ...
                  5.5593E-03,-4.0485E-04, 1.0403E-04, ...
                  9.7795E-05,-4.4813E-04, 1.0662E-04, ...
                 -4.4894E-03,-4.3003E-03,-1.3180E-03, ...
                  1.2638E-03,-2.0937E-04,-1.0982E-04, ...
                 -2.8474E-02, 5.8161E-03,-5.9371E-04, ...
                  1.4721E-03,-1.8707E-04, 6.4902E-05, ...
                  6.2783E-03,-1.3854E-03, 2.9896E-04, ...
                 -7.7301E-04,-1.6992E-05,-2.8036E-02, ...
                  1.9110E-03,-1.7128E-04, 6.0156E-04, ...
                 -1.7487E-04, 2.9229E-03,-1.4161E-03, ...
                  5.1841E-04,-8.2856E-05,-1.0698E-02, ...
                 -4.2081E-03,-4.5016E-04, 5.1778E-07, ...
                  1.4779E-02, 5.7698E-04,-3.6797E-04, ...
                 -4.7711E-03,-1.6291E-03,-4.5695E-04, ...
                  1.1890E-02,-1.6669E-04,-5.5450E-03, ...
                 -1.0370E-03,-4.2745E-03, 1.8717E-03];
    D = zeros(NI,NJ,NK);
    for I=1:NI
      for J=1:NJ-1
        for K=1:NK
          D(I,J,K) = data{I,J}(K);
        end
      end
    end
  end
  DOUT = D;
  for K=1:NK
    for I=1:NI
      DOUT(I,NJ,K)=D(I,NJ-1,K)*MIRREQ(K);
    end
  end

end

