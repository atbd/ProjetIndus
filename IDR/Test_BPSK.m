clc
clear all
close all

%% Trac� de la r�ponse temporelle

% Fr�quence du signal �l�mentaire
f0 = 200;

% Fr�quence d'�chantillonnage
f_ech = 8000;

% Nombre de bits
N = 3000;

% G�n�ration de la s�quence de bits
sequence = (2*randi(2,1,N))'-3;

t = linspace(0,(1/f0)-(1/f_ech),round(f_ech/f0))';
temps = linspace(0,N/f0,N*fix(f_ech/f0))';
symbole = sin(2*pi*f0*t);

s = kron(sequence, symbole);
disp(size(s))
disp(size(t))
disp(size(temps))

subplot(1,2,1)
plot(temps, s)
title('Exemple de modulation BPSK')
xlabel('Temps (s)')
ylabel('Signal x(t)')
grid on

%% Trac� de la FFT 

% Z�ro-padding
N_fft = 2^(nextpow2(N)+5);
N_points = N*fix(f_ech/f0);

% Cr�ation du vecteur contenant toutes les fr�quences jusqu'a Fe/2 (puisque
% au dela, on retombe sur le spectre sym�tris�)
f = linspace(0,(f_ech-1)/2,N_fft/2);

% Calcul du p�riodogramme = 1/N |TFD[x(t)]|2
Spectre = (abs(fft(s,N_fft)).^2)/N_points;

% Meme remarque que pr�c�demment : il n'y a que la moiti� du vecteur
% contenant le spectre qui nous int�resse (au-dela, c'est le sym�trique)
Spectre = Spectre(1:(N_fft/2),:);

% On effectue le trac�
subplot(1,2,2)
plot(f,Spectre) 
title('Spectre du signal g�n�r�'); xlabel('Fr�quence');
legend('Spectre')
grid on