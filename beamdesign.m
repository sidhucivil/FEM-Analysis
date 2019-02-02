% this script is for desgn of beam

E = 200e6;
I = 65;
delta_x = 1;
x = (0:delta_x:6)';
M = zeros(size(x,1),1);
V = M;
y = M;

for  i = 1: size(x,1);
    M(i) = .5 * x(i); disp(['M(i) = ',num2str(M(i))])
    V(i) = .5; disp(['V(i) = ',num2str(V(i))])
    y(i) = .5/6 * x(i)^3 + .666*x(i); disp(['y(i) = ',num2str(y(i))])
    if x(i)>2;
        M(i) = M(i) - 4 * (x(i) - 2)^0; disp(['M(i) = ',num2str(M(i))])
        y(i) = y(i) - 2 *(x(i) -2)^2; disp(['y(i) = ',num2str(y(i))])
        if x(i) > 4;
            M(i) = M(i) + 1.5 * (x(i) - 4) - (x(i) - 4)^2/2; disp(['M(i) = ',num2str(M(i))])
            V(i) = V(i) + 1.5 - (x(i)-4); disp(['V(i) = ',num2str(V(i))])
            y(i) = y(i) - 1.5/6 * (x(i) - 4)^3; disp(['y(i) = ',num2str(y(i))])
            if x(i) == 6;
                y(i) = y(i) - (x(i) - 4)^4/24; disp(['y(i) = ',num2str(y(i))])
            end
        end
    end
end

y = y/(E*I); 

figure(1);  
plot(x, M, 'r')
grid
title('Bending moment function ')
xlabel('x, meter')
ylabel('M(x), kN-m')


figure(2);  
plot(x, V, 'r')
grid
title('Shear force function ')
xlabel('x, meter')
ylabel('V(x), kN')


figure(3);  
plot(x, y, 'r')
grid
title('Deflection of beam ')
xlabel('x, meters')
ylabel('y, meters')

