function t = non_uniform_time(t_unif,loi,type,fe,parametre)
%% Génération des instants de l'échantillonnage non-uniforme
%-------------------------------------------------------------------------%
% Arguments :
%   t_unif : vecteur des temps du signal de départ (espacés
%uniformément);
%   loi : choix de la distribution des epsilon;
%   type : modèle des instants générés (jitter ou ARS);
%   fe : fréquence moyenne d'échantillonnage;
%   parametre : vecteur ligne contenant les paramètres propres à chacune
% des lois (sigma (écart type) dans le cas gaussien, bornes de l'intervalle
%dans le cas uniforme)
%
% Sortie :
%   t : vecteur des instants répartis non uniformément.
%%-----------------------------------------------------------------------%%
%-Paramètres généraux----------------------------------------------------%%
N = floor(t_unif(end)*fe);
T = 1/fe;

if isequal(nargin,4) % paramètres par défaut
    switch loi
        case 'unif'
            switch type
                case 'jitter'
                    parametre = [-0.5,0.5];
                case 'ars'
                    parametre = [0.5,1.5];
            end
        case 'gaussian'
            parametre = 1/(2*fe);
    end
end

switch type
    case 'jitter'
    %-Jitter-------------------------------------------------------------%%
        switch loi
            case 'unif'
                epsilon = [unifrnd(parametre(1)*T,parametre(2)*T,1,N-1),unifrnd(parametre(1)*T,0,1,1)]; % unifrnd(t_unif(1),parametre(2)*T,1,1), pour éviter que le premier terme ne soit négatif;
            case 'gaussian'
                epsilon = normrnd(T,parametre,1,N); % pour éviter que le premier terme ne soit négatif, on prend epsilon(0)=0;        
            otherwise
                error('Unexpected distribution. No vector created.');
        end
        t = sort(T*(1:N) + epsilon); % vérifier que les temps soient bien ordonnés dans le cas gaussien
        % la commande "sort" permet d'éviter l'inversion des instants suite
        % à l'utilisation de la loi normale...
    case 'ars'
    %-ARS----------------------------------------------------------------%%
        switch loi
            case 'unif'
                epsilon = [t_unif(1),unifrnd(parametre(1)*T,parametre(2)*T,1,N-1)];
            case 'gaussian' % vaudrait-il mieux choisir une gaussienne tronquée ??
                epsilon = normrnd(T,parametre,1,N);
            otherwise
                error('Unexpected distribution. No vector created.');
        end
        
        t1 = sort(cumsum(epsilon));
        id = (t1<=t_unif(end)) & (t1>=0); % seuls les éléments tels que t_ARS <= max(t) = t(end) et t_ARS>=0 sont conservés
        t = t1(id);
               
    otherwise
        error('Unexpected model. No vector created.');
end

