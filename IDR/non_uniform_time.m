function t = non_uniform_time(t_unif,loi,type,fe,parametre)
%% G�n�ration des instants de l'�chantillonnage non-uniforme
%-------------------------------------------------------------------------%
% Arguments :
%   t_unif : vecteur des temps du signal de d�part (espac�s
%uniform�ment);
%   loi : choix de la distribution des epsilon;
%   type : mod�le des instants g�n�r�s (jitter ou ARS);
%   fe : fr�quence moyenne d'�chantillonnage;
%   parametre : vecteur ligne contenant les param�tres propres � chacune
% des lois (sigma (�cart type) dans le cas gaussien, bornes de l'intervalle
%dans le cas uniforme)
%
% Sortie :
%   t : vecteur des instants r�partis non uniform�ment.
%%-----------------------------------------------------------------------%%
%-Param�tres g�n�raux----------------------------------------------------%%
N = floor(t_unif(end)*fe);
T = 1/fe;

if isequal(nargin,4) % param�tres par d�faut
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
                epsilon = [unifrnd(parametre(1)*T,parametre(2)*T,1,N-1),unifrnd(parametre(1)*T,0,1,1)]; % unifrnd(t_unif(1),parametre(2)*T,1,1), pour �viter que le premier terme ne soit n�gatif;
            case 'gaussian'
                epsilon = normrnd(T,parametre,1,N); % pour �viter que le premier terme ne soit n�gatif, on prend epsilon(0)=0;        
            otherwise
                error('Unexpected distribution. No vector created.');
        end
        t = sort(T*(1:N) + epsilon); % v�rifier que les temps soient bien ordonn�s dans le cas gaussien
        % la commande "sort" permet d'�viter l'inversion des instants suite
        % � l'utilisation de la loi normale...
    case 'ars'
    %-ARS----------------------------------------------------------------%%
        switch loi
            case 'unif'
                epsilon = [t_unif(1),unifrnd(parametre(1)*T,parametre(2)*T,1,N-1)];
            case 'gaussian' % vaudrait-il mieux choisir une gaussienne tronqu�e ??
                epsilon = normrnd(T,parametre,1,N);
            otherwise
                error('Unexpected distribution. No vector created.');
        end
        
        t1 = sort(cumsum(epsilon));
        id = (t1<=t_unif(end)) & (t1>=0); % seuls les �l�ments tels que t_ARS <= max(t) = t(end) et t_ARS>=0 sont conserv�s
        t = t1(id);
               
    otherwise
        error('Unexpected model. No vector created.');
end

