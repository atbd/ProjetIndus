function y = f_k(t, t_ech, k)
% =========================================================================
% Projet industriel 2014 - �chantillonnage non-uniforme  
% Quentin BIACHE
%
% La fonction 'f_k' permet d'�valuer la fonction du m�me nom qui appara�t
% dans l'expression de la formule de Lagrange modifi�e :
% 
%      r(t_eval) = somme[ x(t_ech[k]) f_k(t_eval)/f_k(t_ech[k]), k ]
%
% t_ech contient l'ensemble des instants d'�chantillonnage non-uniforme.
% =========================================================================

% % Version sans polyn�mes
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
%     % Le p�le 't' disparait (puisqu'il se simplifie avec le sinc, ce qui
%     % l�ve l'ind�termination)
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

% % Version sans polyn�mes et optimis�e
% % -----------------------------------
% 
% t_k = t_ech;
% t_k(k) = [];
% 
% % Nombre de racines au num�rateur
% M = length(t_k);
% 
% poles = 1:(M-1);
% 
% Num = 1-(kron(ones(M,1),t')./kron(ones(1,length(t)),t_k));
% Num = prod(Num);
% if ((t == fix(t)) && (t <= M-1) && (t >= 1)) % Si t est dans [|1, M-1|]
%     % Le p�le 't' disparait (puisqu'il se simplifie avec le sinc, ce qui
%     % l�ve l'ind�termination)
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

% Version sym�trique
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
    % Le p�le 't' disparait (puisqu'il se simplifie avec le sinc, ce qui
    % l�ve l'ind�termination)
    
    % Pour �liminer le p�le t du vecteur contenant les p�les, il faut
    % exploiter la relation qu'il y a entre l'entier relatif t et sa
    % position dans le vecteur des poles, � savoir :
    %   pos(t) = t + M si t < 0
    %   pos(t) = t + M - 1 si t >= 0
    %
    % puisque le vecteur des poles est de la forme :
    %   poles = [-(M-1),...,-1,1,...,(M-1)]
    % 
    % Le fait que le '0' est exclu du vecteur provoque cette discontinuit�
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

