clc
close all
clear all
L= 0.1; %% wall thickness
n = 10; %% number of surface nodes
T0 = 0 ; %% initial temp
T1s = 40; %surface 1 temp
T2s = 20; %surface 2 temp
dx = L/n; %node thickness
alpha = 0.0001; %thermal diffusivity
t_final = 60;%simulation time
dt = 0.1; %fixed time setup
x = dx/2:dx:L-dx/2;
T = ones(n,1)*T0;
dTdt = zeros(n,1) ;
t = 0:dt:t_final;
for j=1:length(t)
    for i = 2:n-1
        dTdt(i) = alpha*(-T(i)-T(i-1)/dx^2+(T(i+1)-T(i))/dx^2);
    end
     dTdt(1) = alpha*(-T(1)-T1s/dx^2+(T(2)-T(1))/dx^2);
      dTdt(n) = alpha*(-T(n)-T(n-1)/dx^2+(T2s-T(n))/dx^2);
      T = T+dTdt*dt;
      figure(1)
      plot(x,T,'Linewidth',3)
      axis([0 L 0 50])
      xlabel('Distance (m)')
      ylabel('Temperature (\circC')
      pause(0.1)
end


