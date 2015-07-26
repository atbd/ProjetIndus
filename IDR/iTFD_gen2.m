function [ s , f1 ] = iTFD_gen( t, S, Tmoy, Nfft)
%% Description de la fonction--------------------------------------------%%
%   Cacul de la transformée de Fourier discrète inverse d'un
%   signal échantillonné non-uniformément dans le domaine temporel 
%%-----------------------------------------------------------------------%%  
%   Arguments :
%    - t : Vecteur colonne des instants d'échantillonnages relatifs au signal S.
%    - S : Vecteur colonne des valeurs du signal dans le domaine
%    fréquentiel (fréquences uniformes). 
%    - Tmoy : Période moyenne d'échantillonnage.
%    - Nfft : Nombre de points en fréquence.
%
%   Sortie :
%    - s : Transformée de Fourier discrète inverse généralisée aux signaux
%    échantillonnés non-uniformément.
%%-----------------------------------------------------------------------%%

%% Création du vecteur des différences d'instants d'échantillonnage
f1 = linspace(0,1,Nfft)/Tmoy; %ligne f, fréquences réparties uniformément.
delta = [0;diff(f1)']; 

if (size(S) ~= size(delta))
	S=S';
end

%% Pondération par delta
S_tot = S.*delta;

%% Calcul des coefficients de Fourier de base
w = 1i*2*pi*t;         % terme générique de l'exponentielle (colonne)
w = w(:,ones(size(f1))); % duplication de la colonne

%% Création de la table des coefficients de Fourier
f = f1(ones(size(t)),:); % duplication de la ligne pour créer la table des coefficients de Fourier
W = exp(w.*f);

%% Calcul de la iTFD généralisée
s = W*S_tot;

end

