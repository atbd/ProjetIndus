function s = QPSK(t_uniforme,N,f_ech,f)

% =========================================================================
% Projet industriel 2014 - Échantillonnage non-uniforme
%
% Fonction de génération d'un signal QPSK
% 
% t = vecteur des instants où la fonction est évaluée
% N = nombre de symboles
% f_ech = fréquence d'échantillonnage
% f = frequence du signal
% =========================================================================

% Nombre de points de signal
N_pts = length(t_uniforme);

% Nombre de points par symboles
N_symb = ceil(N_pts/N);

s = 2*pi*f*t_uniforme;

% Création des bits
phase = [pi/4;3*pi/4;5*pi/4;7*pi/4];
B = phase(randi([1 4],N,1));
phase = kron(B,ones(N_symb,1));

s = sin(s + phase(1:N_pts));

end

