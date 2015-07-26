function [ t_reconst ,S_reconst ] = reconstruction_matricielle_finale( t, S, Tmoy, N )
%% Description de la fonction
%-------------------------------------------------------------------------%
%   Cette fonction permet de reconstruire un signal �chantillonn�
%   non-uniform�ment en un signal �chantillonn� uniform�ment � la fr�quence
%   de Shannon moyenne.
%
%   Arguments :
%       - t : Vecteur colonne des instants d'�chantillonnage correspondant 
%       au point de signal � la m�me position dans le vecteur suivant.
%       - S : Vecteur colonne des valeurs du signal aux instants
%       correspondants � la m�me position dans le vecteur pr�c�dent.
%       - Tmoy : P�riode moyenne d'�chantillonnage de l'�chantillonnage
%       non-uniforme.
%       - N : Param�tre de taille de la fen�tre d'observation -> doit �tre
%       impair en attendant modifications
%
%   Sorties : 
%       - t_reconst : Vecteur des instants d'�chantillonnage uniformes
%       r�sultant.
%       - S_reconst : Vecteur des valeurs du signal r��chantillonn�
%       uniform�ment � la fr�quence 1/Tmoy
%-------------------------------------------------------------------------%

tm = (1:length(t))*Tmoy;

S_reconst=zeros(length(t)+1-N,1);
t_reconst=zeros(length(t)+1-N,1);

for i=1:length(t)-N+1 
    tk=tm(i:i+N-1); % Instants uniformes sur la fen�tre consid�r�e
    
    % S�lection de t et S non-uniformes concern�s par la fenetre
    tj_b = t<=tk(end);    % borne haute
    tj_h = t>=tk(1);      % borne basse
    tj1 = tj_b.*tj_h.*t;
    id = (tj1 ~=0);
    tj = tj1(id); % Instants non-uniformes sur la fen�tre d'observation
    X = S(id);    % Signal �chantillonn� non-uniform�ment sur la fen�tre d'observation
    
%% Calcul de la matrice de passage A de S_reconst vers S sur la fen�tre de N points
    A=sinc((tj(:,ones(size(tk)))-tk(ones(size(tj)),:))/Tmoy);
    
    S_reconst_temp=pinv(A)*X;
    S_reconst(i,1)=S_reconst_temp(floor(N/2)+1);
    t_reconst(i,1)=tk(floor(N/2)+1);

end % Calcul du signal reconstruit � la fr�quence d'�chantillonnage 1/Tmoy
