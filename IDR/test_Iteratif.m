clc
close all
clear all

f_ech = 4410;
Ts = 1/f_ech;

f0 = 440;

t_u = linspace(0,1,f_ech)';
t_nu = t_u + ((-0.5*Ts) + Ts.*rand(f_ech,1)); 

s = sin(2*pi*f0*t_nu);

[ X_f, tf ] = recons_iter(s', t_u', t_nu',51, f_ech,440,500, 0.1);

plot(t_nu,s,'b+',tf,X_f,'r')


xlabel('t')
ylabel('signal')
legend('Signal original','Signal reconstruit')
title('Reconstruction par algorithme itératif')

grid on
