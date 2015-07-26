clc
clear all
close all

%% Tracé de la réponse temporelle

% Fréquence du signal élémentaire
f0 = 200;

% Fréquence d'échantillonnage
f_ech = 8000;

% Nombre de bits
N = 3000;

% Génération de la séquence de bits
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

%% Tracé de la FFT 

% Zéro-padding
N_fft = 2^(nextpow2(N)+5);
N_points = N*fix(f_ech/f0);

% Création du vecteur contenant toutes les fréquences jusqu'a Fe/2 (puisque
% au dela, on retombe sur le spectre symétrisé)
f = linspace(0,(f_ech-1)/2,N_fft/2);

% Calcul du périodogramme = 1/N |TFD[x(t)]|2
Spectre = (abs(fft(s,N_fft)).^2)/N_points;

% Meme remarque que précédemment : il n'y a que la moitié du vecteur
% contenant le spectre qui nous intéresse (au-dela, c'est le symétrique)
Spectre = Spectre(1:(N_fft/2),:);

% On effectue le tracé
subplot(1,2,2)
plot(f,Spectre) 
title('Spectre du signal généré'); xlabel('Fréquence');
legend('Spectre')
grid on