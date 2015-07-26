function [s] = reconstructionShannon(f_ech, N_w, signal, instantsUniform, instantsNonUniform)

% Fréquence d'échantillonnage
%f_ech = 1500;

% Fréquence du sinus
%f_0 = 150;

% Sur-échantillonnage à 8 kHz (échantillonnage de l'interpolation)
%f_eval = 8000;

% Nombre d'échantillons du sinus 
%N_ech = 1000;

% Nombre de points d'interpolation
%N_ech = 1000;

N_ech = length(instantsUniform);

% Taille de la fenêtre
%N_w = 51;

% Vecteur ligne des temps échantillonnés
%instantsNonUniform = linspace(0,(N_ech-1)/f_ech,N_ech)';

% Création du signal
%x = sin(2*pi*f_0*instantsNonUniform);

% Vecteur colonne des temps où on évalue la fonction reconstruite
%instantsUniform = linspace(0,(N_ech-1)/f_eval,N_ech)';

% ------------------------
% Reconstruction du signal
% ------------------------

M = kron(ones(1,N_ech),instantsUniform) - kron(ones(N_ech,1),instantsNonUniform');
M = sinc(f_ech*M);

for i = 1:N_ech
    
    % on supprime dans la matrice M tous les termes hors de la fenêtre
    [m,p] = window_find(instantsUniform(i),instantsNonUniform,N_w);
    M(i,:) = M(i,:).*[zeros(1,m-1) ones(1,p-m+1) zeros(1,N_ech-p)];
      
    %for k = m:1:p
    %    s(i) = s(i) + (x(k).*sinc(f_ech*(instantsUniform(i)-instantsNonUniform(k))));
    %end
    
    %M = kron(ones(1,length(instantsNonUniform(m:p))),instantsUniform(i))-kron(ones(length(instantsUniform(i)),1),instantsNonUniform(m:p)');
    %M = sinc(f_ech*M);
    %s(i) = M*x;
end

s = M*signal;

%plot(instantsUniform,s,'-',instantsNonUniform,x,'+')
%grid on
end