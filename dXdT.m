function [ f ] = dXdT( t, x )
%DXDT Summary of this function goes here
%   Detailed explanation goes here

Ctcp = x(1);    %a
Cdhaa = x(2);   %b 
Crdcp = x(3);    %c
Chhec = x(4);    %d
Csdcp = x(5);    %e
Cech = x(6);    %f
% Cecha = x(7);    %g


k1 = 0.58;    %k1 = kcat,TCP,(R)-DCP
k2 = 1.79;    %k2 = km,TCP
k3 = 0.47;    %k3 = kcat,TCP,(S)-DCP
k4 = 1.81;    %k4 = kcat,(R)-DCP
k5 = 2.49;    %k5 = km,(R)-DCP
k6 = 0.08;    %k6 = kcat,(S)-DCP
k7 = 3.33;    %k7 = km,(S)-DCP
% k8 = 14.37;   %k8 = kcat,ECH
% k9 = 0.09;    %k9 = km,ECH

dCtcpdt = - (k1*Cdhaa*Ctcp)/(Ctcp + k2) - (k3*Cdhaa*Ctcp)/(Ctcp + k2);
dCrdcpdt = (k1*Cdhaa*Ctcp)/(Ctcp + k2) - (k4*Chhec*Crdcp)/(Crdcp + k5);
dCsdcpdt = (k3*Cdhaa*Ctcp)/(Ctcp + k2) - (k6*Chhec*Csdcp)/(Csdcp + k7);
dCechdt = (k4*Chhec*Crdcp)/(Crdcp + k5) + (k6*Chhec*Csdcp)/(Csdcp + k7);
dCdhaadt = 0;
dChhecdt = 0;

f = [dCtcpdt; dCdhaadt; dCrdcpdt; dChhecdt; dCsdcpdt; dCechdt];

end