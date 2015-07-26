clear all;
close all;
clc;

%% initialisation
% load('ECG_PATHO1.mat')
f0 = 1000; % fréquence du sinus 2.2*f0
sigma2 = 1;
B=1000;
fe_surech = 20*2.2*(f0+B/2);%4*f0; % fréquence de suréchantillonnage 44*f0
N = 512;%1024; % nombre de points 2048
[ t,X,fmax_25dB,fmax_50dB ] = sinus_bruite_filtre(f0,N,sigma2,B,fe_surech,'reel',1,1,0);
fe = 2*fmax_50dB; % fréquence d'échantillonnage

% fe=Fs;
% X=ecg(1:512)';
% N=length(X);
% t=[1:N]/fe;


t_n_unif = non_uniform_time(t,'unif','jitter',fe,[-0.5,0.5]);
%X_n_unif = interp1(t,X,t_n_unif,'linear');
X_n_unif = shannon_reconst(t,X,t_n_unif);
        
%% recons fenetre
taille_fenetre = 64;
stop_iter = 1e-3;
[X_f, tf] = recons_iter(X_n_unif,t, t_n_unif,taille_fenetre, fe,fe_surech,f0,B, stop_iter );

X1 =  shannon_reconst(t,X,tf);
%X1 =  interp1(t,X,tf,'linear');
Ef = norm(X1'-X_f,2)/norm(X1',2);

figure;
plot(tf,X1)
hold on
plot(tf,X_f,'r')
legend('signal initial','signal reconstruit')



