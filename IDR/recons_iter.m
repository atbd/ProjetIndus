function [ X_f, tf ] = recons_iter(X_n_unif, t, t_n_unif,taille_fenetre, fe,f0,B, stop_iter)
% Reconstruction itérative avec fenetrage
%Inputs : X : signal de départ(utilisé pour calculer l'arreur relative
%entre 2 itérations)
%         t : axe des temps (uniforme)
%         t_n_unif : axe des temps non uniformes
%         taille_fenetre : taille de la fenetre de travail
%         fe : fréquence d'achantillonnage
%         fe_surech : fréquence d'achantillonnage du signal de départ
%         f0 : fréquence fondamentale
%         B : bande du filtre du signal de départ
%         stop_iter : erreur relative de reconstructruction à atteindre
%         pour arreter d'itérer
%
%Outputs : X_f : signal reconstruit
%          tf : temps sur lesquels le signal est reconstruit
%          E : erreur de reconstruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=length(t);
N1 = N-taille_fenetre+1;
X_f=[];tf=[];

for h = 1:N1 % pour chaque fenetre
    
    % Sélection de t et X non-uniformes concernés par la fenetre
    t_n_unifb = t_n_unif<=t(h+taille_fenetre-1);
    t_n_unifh = t_n_unif>=t(h);
    t_n_unif1 = t_n_unifb.*t_n_unifh.*t_n_unif;
    id = (t_n_unif1 ==0);
    t_n_unif_f = t_n_unif1(~id);
    X_n_unif_f = X_n_unif(~id);

    % Méthode itérative
    [X1, g] = reconstruction_iter(t_n_unif_f,X_n_unif_f, t(h:h+taille_fenetre-1), fe, f0,B,stop_iter);

    % Sélection du point milieu à conserver
    X_f = [X_f;X1(floor(taille_fenetre/2)+1)];
    ti = (t(h)+t(h+taille_fenetre-1))/2;
    tf = [tf ti];
    
    clc
    disp(['Avancement méthode itérative : ', num2str(100*h/N1), '%.'])
end

end

