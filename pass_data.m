%% This script will run a nested loops to try all the parameters & output tao values.

S = [0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60];
E = [0.0001 0.00025 0.0005 0.00075 0.001 0.0025 0.005 0.0075 0.01 0.025 0.05 0.075 0.1];

for i = 1:length(S)
    for j = 1:length(E)
	    s = S(i);
            e1 = E(j);
            e2 = E(j);
            if e1 == 0.1
                t = 30 + 7*i;
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.075
                t = 40 + 10*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.05
                t = 50 + 10*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.025
                t = 100 + 20*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.01
                t = 250 + 50*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.0075
                t = 350 + 70*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.005
                t = 500 + 100*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.0025
                t = 1100 + 170*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.001
                t = 2500 + 700*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.00075
                t = 4000 + 1000*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.0005
                t = 6000 + 1100*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.00025
                t = 11000 + 2000*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            elseif e1 == 0.0001
                t = 24000 + 7000*(i-1);
                [T, x] = ode15s(@dXdT,[0 t], [s e1 0 e2 0 0]);
            end
            xi = 0:1:t;
            yi = interp1(T(:,1), x(:,6), xi, 'spline');
            z = ceil(0.4*length(xi));
            m = (yi(z) - yi(z-1))/(xi(z) - xi(z-1));
            xint = xi(z) - (yi(z)/m);
            yint = yi(z) - m*xi(z);
            param = [s e1 xint yint];
            dlmwrite('tao_data.txt',param,'-append');
    end
end