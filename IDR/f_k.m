function y = f_k(t, t_ech, k)
% =========================================================================
% Projet industriel 2014 - Échantillonnage non-uniforme  
% Quentin BIACHE
%
% La fonction 'f_k' permet d'évaluer la fonction du même nom qui apparaît
% dans l'expression de la formule de Lagrange modifiée :
% 
%      r(t_eval) = somme[ x(t_ech[k]) f_k(t_eval)/f_k(t_ech[k]), k ]
%
% t_ech contient l'ensemble des instants d'échantillonnage non-uniforme.
% =========================================================================

% % Version sans polynômes
% % ----------------------
% 
% M = length(t_ech)-1;
% 
% t_k = t_ech;
% t_k(k) = [];
% 
% N = 1;
% D = 1;
% 
% poles = 1:(M-1);
% 
% for l = 1:length(t_k)
%     N = N.*(1-(t./t_k(l)));
% end
% 
% if ((t == fix(t)) && (t <= M-1) && (t >= 1)) % Si t est dans [|1, M-1|]
%     % Le pôle 't' disparait (puisqu'il se simplifie avec le sinc, ce qui
%     % lève l'indétermination)
%     poles(t) = [];
%     
%     for l = 1:length(poles)
%         D = D.*(1-(t./poles(l)));
%     end
%     
%     y = ((-1).^(t+1)).*N./D;
% 
% else    
%     
%     for l = 1:length(poles)
%         D = D.*(1-(t./poles(l)));
%     end 
%     
%     y = N./D;
%     
% end

% % Version sans polynômes et optimisée
% % -----------------------------------
% 
% t_k = t_ech;
% t_k(k) = [];
% 
% % Nombre de racines au numérateur
% M = length(t_k);
% 
% poles = 1:(M-1);
% 
% Num = 1-(kron(ones(M,1),t')./kron(ones(1,length(t)),t_k));
% Num = prod(Num);
% if ((t == fix(t)) && (t <= M-1) && (t >= 1)) % Si t est dans [|1, M-1|]
%     % Le pôle 't' disparait (puisqu'il se simplifie avec le sinc, ce qui
%     % lève l'indétermination)
%     poles(t) = [];
%     
%     Denom = 1-(kron(ones(M-2,1),t')./kron(ones(1,length(t)),poles'));
%     Denom = prod(Denom);
%     
%     y = ((-1).^(t+1)).*Num./Denom;
% 
% else    
%     Denom = 1-(kron(ones(M-1,1),t')./kron(ones(1,length(t)),poles'));
%     Denom = prod(Denom);
%     
%     y = Num./Denom;
%     
% end

% Version symétrique
% ----------------------

M = floor((length(t_ech)-1)/2);

t_k = t_ech;
t_k(k) = [];

N = 1;
D = 1;

poles = [((-M+1):-1),(1:(M-1))];

for l = 1:length(t_k)
    N = N.*(1-(t./t_k(l)));
end

if ((abs(t) == fix(abs(t))) && (abs(t) <= M-1) && (abs(t) >= 1)) % Si |t| est dans [|1, M-1|]
    % Le pôle 't' disparait (puisqu'il se simplifie avec le sinc, ce qui
    % lève l'indétermination)
    
    % Pour éliminer le pôle t du vecteur contenant les pôles, il faut
    % exploiter la relation qu'il y a entre l'entier relatif t et sa
    % position dans le vecteur des poles, à savoir :
    %   pos(t) = t + M si t < 0
    %   pos(t) = t + M - 1 si t >= 0
    %
    % puisque le vecteur des poles est de la forme :
    %   poles = [-(M-1),...,-1,1,...,(M-1)]
    % 
    % Le fait que le '0' est exclu du vecteur provoque cette discontinuité
    % dans l'expression de la position.
    if (t < 0)
        poles(t+M) = [];
    else
        poles(t+M-1) = [];
    end
    
    for l = 1:length(poles)
        D = D.*(1-(t./poles(l)));
    end
    
    y = ((-1).^(t+1)).*N./D;

else    
    
    for l = 1:length(poles)
        D = D.*(1-(t./poles(l)));
    end 
    
    y = N./D;
    
end



end

