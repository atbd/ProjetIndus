function [ X_f, tf ] = recons_iter(X_n_unif, t, t_n_unif,taille_fenetre, fe,f0,B, stop_iter)
% Reconstruction it�rative avec fenetrage
%Inputs : X : signal de d�part(utilis� pour calculer l'arreur relative
%entre 2 it�rations)
%         t : axe des temps (uniforme)
%         t_n_unif : axe des temps non uniformes
%         taille_fenetre : taille de la fenetre de travail
%         fe : fr�quence d'achantillonnage
%         fe_surech : fr�quence d'achantillonnage du signal de d�part
%         f0 : fr�quence fondamentale
%         B : bande du filtre du signal de d�part
%         stop_iter : erreur relative de reconstructruction � atteindre
%         pour arreter d'it�rer
%
%Outputs : X_f : signal reconstruit
%          tf : temps sur lesquels le signal est reconstruit
%          E : erreur de reconstruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=length(t);
N1 = N-taille_fenetre+1;
X_f=[];tf=[];

for h = 1:N1 % pour chaque fenetre
    
    % S�lection de t et X non-uniformes concern�s par la fenetre
    t_n_unifb = t_n_unif<=t(h+taille_fenetre-1);
    t_n_unifh = t_n_unif>=t(h);
    t_n_unif1 = t_n_unifb.*t_n_unifh.*t_n_unif;
    id = (t_n_unif1 ==0);
    t_n_unif_f = t_n_unif1(~id);
    X_n_unif_f = X_n_unif(~id);

    % M�thode it�rative
    [X1, g] = reconstruction_iter(t_n_unif_f,X_n_unif_f, t(h:h+taille_fenetre-1), fe, f0,B,stop_iter);

    % S�lection du point milieu � conserver
    X_f = [X_f;X1(floor(taille_fenetre/2)+1)];
    ti = (t(h)+t(h+taille_fenetre-1))/2;
    tf = [tf ti];
    
    clc
    disp(['Avancement m�thode it�rative : ', num2str(100*h/N1), '%.'])
end

end

