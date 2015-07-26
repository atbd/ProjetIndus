function [ t_reconst ,S_reconst ] = reconstruction_matricielle_finale( t, S, Tmoy, N )
%% Description de la fonction
%-------------------------------------------------------------------------%
%   Cette fonction permet de reconstruire un signal échantillonné
%   non-uniformément en un signal échantillonné uniformément à la fréquence
%   de Shannon moyenne.
%
%   Arguments :
%       - t : Vecteur colonne des instants d'échantillonnage correspondant 
%       au point de signal à la même position dans le vecteur suivant.
%       - S : Vecteur colonne des valeurs du signal aux instants
%       correspondants à la même position dans le vecteur précédent.
%       - Tmoy : Période moyenne d'échantillonnage de l'échantillonnage
%       non-uniforme.
%       - N : Paramètre de taille de la fenêtre d'observation -> doit être
%       impair en attendant modifications
%
%   Sorties : 
%       - t_reconst : Vecteur des instants d'échantillonnage uniformes
%       résultant.
%       - S_reconst : Vecteur des valeurs du signal rééchantillonné
%       uniformément à la fréquence 1/Tmoy
%-------------------------------------------------------------------------%

tm = (1:length(t))*Tmoy;

S_reconst=zeros(length(t)+1-N,1);
t_reconst=zeros(length(t)+1-N,1);

for i=1:length(t)-N+1 
    tk=tm(i:i+N-1); % Instants uniformes sur la fenêtre considérée
    
    % Sélection de t et S non-uniformes concernés par la fenetre
    tj_b = t<=tk(end);    % borne haute
    tj_h = t>=tk(1);      % borne basse
    tj1 = tj_b.*tj_h.*t;
    id = (tj1 ~=0);
    tj = tj1(id); % Instants non-uniformes sur la fenêtre d'observation
    X = S(id);    % Signal échantillonné non-uniformément sur la fenêtre d'observation
    
%% Calcul de la matrice de passage A de S_reconst vers S sur la fenêtre de N points
    A=sinc((tj(:,ones(size(tk)))-tk(ones(size(tj)),:))/Tmoy);
    
    S_reconst_temp=pinv(A)*X;
    S_reconst(i,1)=S_reconst_temp(floor(N/2)+1);
    t_reconst(i,1)=tk(floor(N/2)+1);

end % Calcul du signal reconstruit à la fréquence d'échantillonnage 1/Tmoy
