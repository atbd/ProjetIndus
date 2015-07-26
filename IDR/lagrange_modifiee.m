function Z = lagrange_modifiee(t,tk,Ztk)
%% Reconstruction du signal échantillonné N.U sur une fenêtre d'observation
%%-(par la formule de Lagrange modifiée)
%-------------------------------------------------------------------------%
% Arguments :
%   t : vecteur des temps pour le signal reconstruit; (colonne)
%   tk : vecteur des instants d'échantillonnage non-uniformes; (colonne)
%   Ztk : signal échantillonné non-uniformément (vecteur colonne des Z(tk));
% Sortie :
%   Z : signal reconstruit (vecteur colonne des Z(t)).
%-------------------------------------------------------------------------%

%-Calcul de HM(t)
H = HM(t,tk);
    
%-Calcul de a_M(t,tk) (matrice)
A = a_M(t,tk);

%-Calcul de Z(t), signal reconstruit
Z = H.*(A*Ztk);

end


