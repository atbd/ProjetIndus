function [ F ] = TFD_gen( t, S, Tmoy, Nfft, window )
%% Description de la fonction
%   calcul de la transformée de Fourier discrète d'un
%   signal échantillonné non-uniformément dans le cas général. 
%%-----------------------------------------------------------------------%%   
%   Arguments :
%    - t : Vecteur colonne des instants d'échantillonnages relatifs au signal S.
%    - S : Vecteur colonne des valeurs du signal échantillonné
%    non-uniformément.
%    - Tmoy : Période moyenne d'échantillonnage (si besoin est).
%    - Nfft : Nombre de points en fréquence.
%    - window : chaîne de caractères indiquant la fenêtre d'apodisation
%    choisie pour réduire (ou non) les effets de bords.
%
%   Sortie :
%    - F : Transformée de Fourier discrète généralisée aux signaux
%    échantillonnés non-uniformément.
%%-----------------------------------------------------------------------%% 
%% Création de la fenêtre d'apodisation                
switch(window)
    case 'Hamming'
        APO=0.54-0.46*cos(2*pi*t/max(t));
    case 'Hann'
        APO=0.5*(1-cos(2*pi*t/max(t)));
    otherwise
        % Cas rectangulaire
        APO=ones(size(t));
end

%% Création du vecteur des différences d'instants d'échantillonnage
t1 = [0;t(1:end-1)]; 
delta = t-t1; 
% plus simplement : delta = [0 ;diff(t)']

%% Pondération du signal par la fenêtre
S_apo = S.*APO; % Signal pondéré par la fenêtre d'apodisation (Vecteur colonne)

%% Pondération par delta
S_tot = S_apo.*delta;

%% Calcul des coefficients de Fourier de base
w = -1i*2*pi*t';      % terme générique de l'exponentielle (ligne)
w = w(ones(Nfft,1),:); % duplication de la ligne

%% Création de la table des coefficients de Fourier
f = linspace(-0.5,0.5,Nfft)'/Tmoy; % colonne
f = f(:,ones(size(t))); % duplication de la colonne pour créer la table des coefficients de Fourier
W = exp(w.*f);

%% Calcul de la TFD généralisée
F = W*S_tot;

end

