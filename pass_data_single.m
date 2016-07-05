%% This script will run a nested loops to try all the parameters & output tao values.

S = [0.0001 0.0002 0.0003 0.0004 0.0005 0.0006 0.0007 0.0008 0.0009 0.001 0.002 0.003 0.004 0.005 0.006 0.007 0.008 0.009 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60];
E = 0.00025;

for i = 1:length(S)
	    s = S(i);
            e1 = E;
            e2 = E;
            if s < 0.1
                t = 13000;
            else
                t = 13000 + 2000*(i-28);
            end
            [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            xi = 0:1:t;
            yi = interp1(T(:,1), x(:,6), xi, 'spline');
            z = ceil(0.4*length(xi));
            m = (yi(z) - yi(z-1))/(xi(z) - xi(z-1));
            xint = xi(z) - (yi(z)/m);
            param = [s xint];
            dlmwrite('tao_data2.txt',param,'-append');
end