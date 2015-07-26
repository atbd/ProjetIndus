function [ s , f1 ] = iTFD_gen( t, S, Tmoy, Nfft)
%% Description de la fonction--------------------------------------------%%
%   Cacul de la transform�e de Fourier discr�te inverse d'un
%   signal �chantillonn� non-uniform�ment dans le domaine temporel 
%%-----------------------------------------------------------------------%%  
%   Arguments :
%    - t : Vecteur colonne des instants d'�chantillonnages relatifs au signal S.
%    - S : Vecteur colonne des valeurs du signal dans le domaine
%    fr�quentiel (fr�quences uniformes). 
%    - Tmoy : P�riode moyenne d'�chantillonnage.
%    - Nfft : Nombre de points en fr�quence.
%
%   Sortie :
%    - s : Transform�e de Fourier discr�te inverse g�n�ralis�e aux signaux
%    �chantillonn�s non-uniform�ment.
%%-----------------------------------------------------------------------%%

%% Cr�ation du vecteur des diff�rences d'instants d'�chantillonnage
f1 = linspace(0,1,Nfft)/Tmoy; %ligne f, fr�quences r�parties uniform�ment.
delta = [0;diff(f1)']; 

if (size(S) ~= size(delta))
	S=S';
end

%% Pond�ration par delta
S_tot = S.*delta;

%% Calcul des coefficients de Fourier de base
w = 1i*2*pi*t;         % terme g�n�rique de l'exponentielle (colonne)
w = w(:,ones(size(f1))); % duplication de la colonne

%% Cr�ation de la table des coefficients de Fourier
f = f1(ones(size(t)),:); % duplication de la ligne pour cr�er la table des coefficients de Fourier
W = exp(w.*f);

%% Calcul de la iTFD g�n�ralis�e
s = W*S_tot;

end

