function [Zl] = reconstruction_lagrange(t,tk,Ztk,M)
%% Reconstruction du signal échantillonné non-uniformément selon la formule
%% modifiée de Lagrange
%-------------------------------------------------------------------------%
% Arguments :
%   t : vecteur des instants uniformes; (colonne)
%   tk : vecteur des instants d'échantillonnage; (colonne)  
%   Ztk : signal échantillonné non-uniformément (vecteur colonne des Z(tk));
%   M : taille de la fenêtre d'observation; (nombre pair ou impair)
%
% Sortie :
%   Zl : signal reconstruit (vecteur colonne des Z(t)).
%   tl : instants uniformément répartis auxquels est reconstruit le signal
%-------------------------------------------------------------------------%

%-Reconstruction du signal, calculs effectués sur chacune des fenêtres
%-d'observation (fenêtre glissante)
N = length(t);
Zl = zeros(N-M+1,1); % Signal reconstruit
tl = zeros(N-M+1,1); % vecteur des temps du signal reconstruit

q = 1; % Variable d'indexation des éléments reconstruits

for k = 1 : N-M+1 
    t1 = t(k:k+M-1);   % Vecteur des instants uniformes sur la fenêtre d'observation
    
    % Sélection des tk et Ztk non-uniformes concernés par la fenêtre
    tk_h = tk<=t1(end);    % borne haute
    tk_b = tk>=t1(1);      % borne basse
    tk1 = tk_b.*tk_h.*tk;
    id = (tk1~=0);
    tk_f = tk1(id); % Instants non-uniformes sur la fenêtre d'observation
    Z1 = Ztk(id);   % Signal échantillonné non-uniformément sur la fenêtre d'observation
    
    Z1 = lagrange_modifiee(t1,tk_f,Z1); % Reconstruction effectuée sur chacune des fenêtres d'observation    
    
    tl(q) = t1(floor(M/2)+1);
    Zl(q) = Z1(floor(M/2)+1);         % Le point milieu (ou proche du milieu dans le cas d'une fenêtre paire) 
                                      % est conservé pour s'affranchir des effets de bord     
    q = q+1;
end

end

