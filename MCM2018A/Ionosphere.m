function  [xz,y,z] = Ionosphere(arg1,arg2)
    if nargin == 0
        dx = 1/8;
        [x,y] = meshgrid(0:dx:10);
    elseif nargin == 1
        if length(arg1) == 1
            [x,y] = meshgrid(linspace(0,10,arg1));
        else
            [x,y] = meshgrid(arg1,arg1);     
        end
    else
        x = arg1; y = arg2;
    end
    
    y = y-1;
    x = x-1;
    z =  3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
       - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
       - 1/3*exp(-(x+1).^2 - y.^2);
    y = y-2;
    x = x-2;
    z =  -0.4*(3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
       - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
       - 1/3*exp(-(x+1).^2 - y.^2)+4) + z;
    y = y-1;
    x = x-2;
    z =  -0.3*(3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
       - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
       - 1/3*exp(-(x+1).^2 - y.^2)+4) + z;
    y = y-4;
    x = x-3;
    z =  3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
       - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
       - 1/3*exp(-(x+1).^2 - y.^2)+4 + z;
    x_t = x;
    x = x+5;
    z =  -0.2*(3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
       - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
       - 1/3*exp(-(x+1).^2 - y.^2)+4) + z;
    x = x+1;
    z =  0.6*(3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
       - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
       - 1/3*exp(-(x+1).^2 - y.^2)+4) + z;
    x = x_t;
    y = y+5;
    z =  0.6*(3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
       - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
       - 1/3*exp(-(x+1).^2 - y.^2)+4) + z;
   
    %Trans Range:
    X_range = (x - min(min(x))) / (max(max(x)) - min(min(x))) * (36-30)+30;
    Y_range = (y - min(min(y))) / (max(max(y)) - min(min(y))) * (123-117)+117;
    Z_range = (z - min(min(z))) / (max(max(z)) - min(min(z))) * (4-3.75) * 10^5+3.75 * 10^5;
    if nargout > 1
        xz = x;
    elseif nargout == 1
        xz = z;
    else
        % Self demonstration
        mesh(X_range,Y_range,Z_range);
        axis('tight')
        xlabel('Latitude£¨¡ã£©'), ylabel('Longitude(¡ã)'), zlabel('Height(m)'),title('Ionosphere')
    end
end