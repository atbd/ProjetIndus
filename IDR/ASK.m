function s = ASK(t_uniforme,N,f_ech,a0,a1,f)

% =========================================================================
% Projet industriel 2014 - Échantillonnage non-uniforme
%
% Fonction de génération d'un signal ASK entre |a0| et |a1|
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

s = sin(2*pi*f*t_uniforme);

% Création des bits
a = abs([a0;a1]);
B = a(randi([1 2],N,1));
symboles = kron(B,ones(N_symb,1));

s = s.*symboles(1:N_pts);

end

