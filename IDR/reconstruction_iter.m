function [X1, g] = reconstruction_iter(t_n_unif,X_n_unif,t,fe,f0,B,stop_iter)
%Methode de reconstruction it�rative
%Inputs : X : signal de d�part(utilis� pour calculer l'arreur relative
%entre 2 it�rations)
%         t_n_unif : axe des temps non uniformes
%         X_n_unif : echantillons r�partis non uniform�ment
%         t : axe des temps (uniforme)
%         fe : fr�quence d'achantillonnage
%         fe_surech : fr�quence d'achantillonnage du signal de d�part
%         f0 : fr�quence fondamentale
%         B : bande du filtre du signal de d�part
%         stop_iter : erreur relative de reconstructruction � atteindre
%         pour arreter d'it�rer
%
%Outputs : X1 : signal reconstruit
%          g : nombre d'it�rations
%          Ef : erreur de reconstruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=length(t);
E=1;
g = 0;

while abs(E)>stop_iter
    g = g + 1; 
    if g ~= 1
        X_n_unif = interp1(t,X1,t_n_unif,'linear');
    end
    
    X_ech_f = interp1(t_n_unif,X_n_unif,t,'nearest'); % Vorono� : cr�tion des steps
    ind = isnan(X_ech_f); % suppression de Nan dus aux bords de l'interpolation
    X_ech_f(ind)=0;

    if g==1
        X_ech_f2 = X_ech_f; % sauvegarde de la premi�re fonction de Vorono�
    else
        X_ech_f=X_ech_f2-X_ech_f; % diff�rence de la nouvelle fonction et l'initiale de vorono�

    end

%%-Tfd-------------------------------------------------------------------%%
    f = fe*linspace(-0.5,0.5,N);
    S = TFD_gen(t', X_ech_f', 1/fe, N, 'Hh');

%%-Troncature du signal--------------------------------------------------%%
    S_tronc = masque_tronc(S',f,f0, B);

%%-Itfd------------------------------------------------------------------%%
    X_recons = real(iTFD_gen(t', S, 1/fe, N));

    if g==1
        X1 = X_recons; % premier signal reconstruit
        E= 1;
    else
        X1 = X1 + X_recons; % ajout de la tfd-itfd de la diff�rence des fonctions de Vorono�
        E = norm(X2-X1,2)/norm(X2,2);
    end
    X2 = X1; % sauvegarde du signal reconstruit   
end

end

