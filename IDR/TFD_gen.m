function [ F ] = TFD_gen( t, S, Tmoy, Nfft, window )
%% Description de la fonction
%   calcul de la transform�e de Fourier discr�te d'un
%   signal �chantillonn� non-uniform�ment dans le cas g�n�ral. 
%%-----------------------------------------------------------------------%%   
%   Arguments :
%    - t : Vecteur colonne des instants d'�chantillonnages relatifs au signal S.
%    - S : Vecteur colonne des valeurs du signal �chantillonn�
%    non-uniform�ment.
%    - Tmoy : P�riode moyenne d'�chantillonnage (si besoin est).
%    - Nfft : Nombre de points en fr�quence.
%    - window : cha�ne de caract�res indiquant la fen�tre d'apodisation
%    choisie pour r�duire (ou non) les effets de bords.
%
%   Sortie :
%    - F : Transform�e de Fourier discr�te g�n�ralis�e aux signaux
%    �chantillonn�s non-uniform�ment.
%%-----------------------------------------------------------------------%% 
%% Cr�ation de la fen�tre d'apodisation                
switch(window)
    case 'Hamming'
        APO=0.54-0.46*cos(2*pi*t/max(t));
    case 'Hann'
        APO=0.5*(1-cos(2*pi*t/max(t)));
    otherwise
        % Cas rectangulaire
        APO=ones(size(t));
end

%% Cr�ation du vecteur des diff�rences d'instants d'�chantillonnage
t1 = [0;t(1:end-1)]; 
delta = t-t1; 
% plus simplement : delta = [0 ;diff(t)']

%% Pond�ration du signal par la fen�tre
S_apo = S.*APO; % Signal pond�r� par la fen�tre d'apodisation (Vecteur colonne)

%% Pond�ration par delta
S_tot = S_apo.*delta;

%% Calcul des coefficients de Fourier de base
w = -1i*2*pi*t';      % terme g�n�rique de l'exponentielle (ligne)
w = w(ones(Nfft,1),:); % duplication de la ligne

%% Cr�ation de la table des coefficients de Fourier
f = linspace(-0.5,0.5,Nfft)'/Tmoy; % colonne
f = f(:,ones(size(t))); % duplication de la colonne pour cr�er la table des coefficients de Fourier
W = exp(w.*f);

%% Calcul de la TFD g�n�ralis�e
F = W*S_tot;

end

