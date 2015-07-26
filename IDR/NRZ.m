function s = NRZ(t_uniforme,N,f_ech)

% =========================================================================
% Projet industriel 2014 - Échantillonnage non-uniforme
%
% Fonction de génération d'un signal NRZ entre -1 et 1
% 
% t = vecteur des instants où la fonction est évaluée
% N = nombre de symboles
% f_ech = fréquence d'échantillonnage
%
% =========================================================================

% Nombre de points de signal
N_pts = length(t_uniforme);

% Nombre de points par symboles
N_symb = ceil(N_pts/N);

% Création des bits
B = floor(0.5 + rand(N,1));

s = kron(B,ones(N_symb,1));

end

