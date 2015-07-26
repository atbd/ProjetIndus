function Z = lagrange_modifiee(t,tk,Ztk)
%% Reconstruction du signal �chantillonn� N.U sur une fen�tre d'observation
%%-(par la formule de Lagrange modifi�e)
%-------------------------------------------------------------------------%
% Arguments :
%   t : vecteur des temps pour le signal reconstruit; (colonne)
%   tk : vecteur des instants d'�chantillonnage non-uniformes; (colonne)
%   Ztk : signal �chantillonn� non-uniform�ment (vecteur colonne des Z(tk));
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


