function s = Manchester(t_uniforme,N,f_ech)

% =========================================================================
% Projet industriel 2014 - �chantillonnage non-uniforme
%
% Fonction de g�n�ration d'un signal Manchester
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
a = [-1;1];
B = a(randi([1 2],N,1));

s = kron(B,[ones(floor(N_symb/2),1); -ones(ceil(N_symb/2),1)]);

end

