%function s = QAM(t,N,f_ech,f,a0,a1)
function [s] = QAM(t_uniforme,N,f_ech,f,a0,a1)
% =========================================================================
% Projet industriel 2014 - Échantillonnage non-uniforme
%
% Fonction de génération d'un signal 16QAM
%
% s = QAM(t,N,f_ech,f,a0,a1)
%
% t = vecteur des instants où la fonction est évaluée
% N = nombre de symboles
% f_ech = fréquence d'échantillonnage
% f = frequence du signal
% a0,a1 = amplitudes possibles
% =========================================================================

% % Création d'instants uniformes à partir des instants non-uniformes
% t_uniforme = (min(t):1/f_ech:max(t))';
% 
% % Nombre de points de signal
% N_pts = length(t_uniforme);
% 
% % Nombre de points par symboles
% N_symb = ceil(N_pts/N);
% 
% s = 2*pi*f*t_uniforme;
% 
% % Création des bits
% amplitude = [a0;a1;sqrt(2)*;];
% phase = 0:11;
% phase = ((2*phase')+1)*pi/12;
% 
% % Choix d'une amplitude au hasard parmi les 2
% A = amplitude(randi([1 2],N,1));
% % Choix d'une phase au hasard parmi les 12
% B = phase(randi([1 12],N,1));
% 
% amplitude = kron(A,ones(N_symb,1));
% phase = kron(B,ones(N_symb,1));
% 
% s = amplitude(1:N_pts).*sin(s + phase(1:N_pts));
% 
% % Calcul du signal aux instants t (pas forcément uniformes)
% s = interp1(t_uniforme,s(1:N_pts),t);
% vect=A
% vect2=B

% Nombre de points de signal
N_pts = length(t_uniforme);

% Nombre de points par symboles
N_symb = ceil(N_pts/N);

s = 2*pi*f*t_uniforme;

% Création des bits
amplitude = sqrt([2;2;2;2;10;10;10;10;10;10;10;10;18;18;18;18]);
phase = [2;21;9;15;1;23;11;13;5;19;7;17;2;21;9;15]*pi/12;

choix = randi([1 16],N,1);

% Choix d'une amplitude au hasard parmi les 2
A = amplitude(choix);
B = phase(choix);

amplitude = kron(A,ones(N_symb,1));
phase = kron(B,ones(N_symb,1));

s = amplitude(1:N_pts).*sin(s + phase(1:N_pts));

end

