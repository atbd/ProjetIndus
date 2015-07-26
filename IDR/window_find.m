function [lower_bound, upper_bound] = window_find(element, samples, N)
% =========================================================================
% Fonction 'window_find'
% ----------------------
%
% La fonction sert à rechercher les indices des échantillons non-uniformes
% extrémaux à conserver pour avoir une fenêtre de N points, centrée sur
% 'element'. 
%
% On renvoie l'indice du premier et du dernier échantillon de
% 'sample' qui compose la fenêtre (ce qui suppose que 'sample' contient les
% temps d'échantillonnage dans l'ordre croissant)
%
% Projet industriel 2014 - 2 EN
%
% =========================================================================

% Recherche du temps du vecteur 'samples' le plus proche du point 'element'
[~,i] = min(abs(samples-element));

% Si N est impair
if (mod(N,2) == 1) 
    % Les bornes de la fenêtre sont les points à une distance (N-1)/2 de
    % l'élément le plus proche de 'element' dans 'samples'
    lower_bound = i - (0.5*(N-1));
    upper_bound = i + (0.5*(N-1));

% Si N est pair
else
    % Suivant que la valeur la plus proche de 'element' est supérieure ou
    % inférieure à 'element', on décale la fenêtre soit vers la droite,
    % soit vers la gauche
    
    if element < samples(i)
        % Décalage à gauche
        lower_bound = i - (0.5*N);    
        upper_bound = i + (0.5*N) - 1;
    else
        % Décalage à droite
        lower_bound = i - (0.5*N) + 1;    
        upper_bound = i + (0.5*N);
    end

end    

if lower_bound <= 0
    %disp('Warning: lower bound is out of range')
    lower_bound = 1;
end

if upper_bound > length(samples)
    %disp('Warning: upper bound is out of range')
    upper_bound = length(samples);
end

end

