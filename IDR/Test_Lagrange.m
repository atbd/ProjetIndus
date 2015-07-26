clc
clear all
close all

% Fréquence du signal sinusoïdal
f_sin = 12;

% Fréquence d'échantillonnage (idéale, avant jitter)
f_ech = 100;

% Nombre de points de signal
N = 1000;
a = (-0.5/f_ech)*0.9;
b = (0.5/f_ech)*0.9;
epsilon = a + (b-a).*rand(N,1);
t_ech = linspace(0,(N-1)/f_ech,N)' + epsilon;
s = sin(2*pi*f_sin*t_ech);

t_eval = (0.0:0.001:5.2)';

for i = 1:length(t_eval)
    [m,p] = window_find(t_eval(i),t_ech,20);
    y(i) = r(s(m:p),t_ech(m:p),t_eval(i));
end

plot(t_ech,s,'b+',t_eval,y,'r-')
xlabel('t')
ylabel('signal')
legend('Signal original','Signal reconstruit')
title('Reconstruction par la formule de Lagrange modifiée')
grid on