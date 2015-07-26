function [ S_reconst ] = shannon_reconst( t,S,t_reconst )
%% Description de la fonction
%
%   Arguments :
%       S : signal à partir duquel on veut interpoler les points de
%       recherche => signal uniforme !!
%       t : instants correspondant aux échantillons du signal S
%       t_reconst : vecteur des instants des points recherchés
%
%   Sorties :
%       S_reconst : signal S reconstruit aux instants t_reconst désirés
%       (vecteur ligne)

%% Mise en forme des paramètres
if isvector(t_reconst)
    if isrow(t_reconst)
        t_reconst=t_reconst';
    end
    if isrow(S)
        S=S';
    end

%% Reconstruction du signal selon la reconstruction de Shannon
    fe= 1/(t(2)-t(1));
    A=sinc((t_reconst(:,ones(size(t)))-t(ones(size(t_reconst)),:))*fe);
    S_reconst=A*S;
    S_reconst=S_reconst';
else
    error('t_reconst n''est pas un vecteur')
end

end

