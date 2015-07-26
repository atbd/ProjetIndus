function s = NRZ(t_uniforme,N,f_ech)

% =========================================================================
% Projet industriel 2014 - �chantillonnage non-uniforme
%
% Fonction de g�n�ration d'un signal NRZ entre -1 et 1
% 
% t = vecteur des instants o� la fonction est �valu�e
% N = nombre de symboles
% f_ech = fr�quence d'�chantillonnage
%
% =========================================================================

% Nombre de points de signal
N_pts = length(t_uniforme);

% Nombre de points par symboles
N_symb = ceil(N_pts/N);

% Cr�ation des bits
B = floor(0.5 + rand(N,1));

s = kron(B,ones(N_symb,1));

end

