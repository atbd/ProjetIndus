function [Zl] = reconstruction_lagrange(t,tk,Ztk,M)
%% Reconstruction du signal �chantillonn� non-uniform�ment selon la formule
%% modifi�e de Lagrange
%-------------------------------------------------------------------------%
% Arguments :
%   t : vecteur des instants uniformes; (colonne)
%   tk : vecteur des instants d'�chantillonnage; (colonne)  
%   Ztk : signal �chantillonn� non-uniform�ment (vecteur colonne des Z(tk));
%   M : taille de la fen�tre d'observation; (nombre pair ou impair)
%
% Sortie :
%   Zl : signal reconstruit (vecteur colonne des Z(t)).
%   tl : instants uniform�ment r�partis auxquels est reconstruit le signal
%-------------------------------------------------------------------------%

%-Reconstruction du signal, calculs effectu�s sur chacune des fen�tres
%-d'observation (fen�tre glissante)
N = length(t);
Zl = zeros(N-M+1,1); % Signal reconstruit
tl = zeros(N-M+1,1); % vecteur des temps du signal reconstruit

q = 1; % Variable d'indexation des �l�ments reconstruits

for k = 1 : N-M+1 
    t1 = t(k:k+M-1);   % Vecteur des instants uniformes sur la fen�tre d'observation
    
    % S�lection des tk et Ztk non-uniformes concern�s par la fen�tre
    tk_h = tk<=t1(end);    % borne haute
    tk_b = tk>=t1(1);      % borne basse
    tk1 = tk_b.*tk_h.*tk;
    id = (tk1~=0);
    tk_f = tk1(id); % Instants non-uniformes sur la fen�tre d'observation
    Z1 = Ztk(id);   % Signal �chantillonn� non-uniform�ment sur la fen�tre d'observation
    
    Z1 = lagrange_modifiee(t1,tk_f,Z1); % Reconstruction effectu�e sur chacune des fen�tres d'observation    
    
    tl(q) = t1(floor(M/2)+1);
    Zl(q) = Z1(floor(M/2)+1);         % Le point milieu (ou proche du milieu dans le cas d'une fen�tre paire) 
                                      % est conserv� pour s'affranchir des effets de bord     
    q = q+1;
end

end

