%%-----------------------------------------------------------------------%%
%               Projet long : échantillonnage non-uniforme                %
%                                                                         %
%                                                                         %
%                                                                         %
%                                                                         %
%                                                                         %
%%-----------------------------------------------------------------------%%


clear all;
close all;
clc;
%load('ECG_PATHO1.mat')
% cf p 37 iterative2
%% Initialisation
f0 = 1000; % fréquence du sinus 2.2*f0
fe_surech = 44*f0; % fréquence de suréchantillonnage 44*f0
sigma2 = 2;
B=200;
N = 1024/2; % nombre de points 2048
[ t,X,fmax_25dB,fmax_50dB ] = sinus_bruite_filtre(f0,N,sigma2,B,fe_surech,'reel',1,1,0);
fe = 2.2*fmax_50dB; % fréquence d'échantillonnage
% fe=Fs;
% X=ecg(1:512)';
% N=length(X);
% t=[1:N]/fe;

figure('Name','Signal surechantillonné','NumberTitle','on')
plot(t,X,'bx')


%% Echantillonage non uniforme

%%-Génération  des temps non uniformes-----------------------------------%%
t_n_unif = non_uniform_time(t,'unif','jitter',fe,[-0.5,0.5]);


%%-Echantillonnage-------------------------------------------------------%%
X1=X; % sauvegarde du signal initial
tic

figure('Name','Signal reconstruit','NumberTitle','on')
E=1;
E_save=0;


g = 0;
%for g=1:10
while abs(E-E_save)>10^(-6)
  g = g + 1; 
    E_save = E;
    
    %X_n_unif = interp1(t,X1,t_n_unif,'linear'); % échantillons non uniformes (avec interpolation) 
    X_n_unif = shannon_reconst(X1,fe_surech,t_n_unif );
    X_ech_f = interp1(t_n_unif,X_n_unif,t,'nearest'); % Voronoï : crétion des steps
    ind = isnan(X_ech_f); % suppression de Nan dus aux bords de l'interpolation
    X_ech_f(ind)=0;

    if g==1
        X_ech_f2 = X_ech_f; % sauvegarde de la première fonction de Voronoï
    else
        X_ech_f=X_ech_f2-X_ech_f; % différence de la nouvelle fonction et l'initiale de voronoï

    end

%%-Tfd-------------------------------------------------------------------%%
    Nfft = 2^(nextpow2(N));
    f = fe*linspace(-0.5,0.5,Nfft);
    S = TFD_gen(t', X_ech_f', 1/fe, Nfft, 'Hh');

%%-Troncature du signal--------------------------------------------------%%
    S_tronc = masque_tronc(S',f,f0, B);

%%-Itfd------------------------------------------------------------------%%
    X_recons = real(iTFD_gen(t', S, 1/fe, Nfft));

    if g==1
        X1 = X_recons; % premier signal reconstruit
    else
    X1 = X1 + X_recons; % ajout de la tfd-itfd de la différence des fonctions de Voronoï
    end

%     if g ==1
%     plot(t,X1,'k')
%     hold on
%     end
%     if g ==2
%     plot(t,X1,'g')
%     end

    E = norm(X'-X1,2)/norm(X,2);
end
toc
plot(t,X,'r')
hold on
plot(t,X1,'bx')
%plot(t_n_unif,X_n_unif,'kx-')
%legend('première itération','deuxième itération', 'signal initial', 'dixième itération')
legend('signal initial', 'dernière itération')


Ef = norm(X'-X1,2)/norm(X,2);
g


