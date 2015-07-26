function [lower_bound, upper_bound] = window_find(element, samples, N)
% =========================================================================
% Fonction 'window_find'
% ----------------------
%
% La fonction sert � rechercher les indices des �chantillons non-uniformes
% extr�maux � conserver pour avoir une fen�tre de N points, centr�e sur
% 'element'. 
%
% On renvoie l'indice du premier et du dernier �chantillon de
% 'sample' qui compose la fen�tre (ce qui suppose que 'sample' contient les
% temps d'�chantillonnage dans l'ordre croissant)
%
% Projet industriel 2014 - 2 EN
%
% =========================================================================

% Recherche du temps du vecteur 'samples' le plus proche du point 'element'
[~,i] = min(abs(samples-element));

% Si N est impair
if (mod(N,2) == 1) 
    % Les bornes de la fen�tre sont les points � une distance (N-1)/2 de
    % l'�l�ment le plus proche de 'element' dans 'samples'
    lower_bound = i - (0.5*(N-1));
    upper_bound = i + (0.5*(N-1));

% Si N est pair
else
    % Suivant que la valeur la plus proche de 'element' est sup�rieure ou
    % inf�rieure � 'element', on d�cale la fen�tre soit vers la droite,
    % soit vers la gauche
    
    if element < samples(i)
        % D�calage � gauche
        lower_bound = i - (0.5*N);    
        upper_bound = i + (0.5*N) - 1;
    else
        % D�calage � droite
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

