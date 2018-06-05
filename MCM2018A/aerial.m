theta=meshgrid(eps:pi/180:pi); 
phi=meshgrid(eps:2*pi/180:2*pi)'; 
%元因子:
f = abs(2*cos(pi*cos(theta))+eps);
f = abs(sin(pi*sin(theta)/2)./sin(theta)).*f;
fmax=max(max(f));
[x,y,z]=sph2cart(phi,pi/2-theta,f/fmax);
%之前第二个变量直接写的是theta，对照说明以后已改正
mesh(x,z,y);
axis([-1 1 0 1 -1 1]);