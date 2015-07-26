function [ s ] = BPSK(f0,N,t)

%%========================================%%
% f0 est la fréquence élémentaire du signal
% N est le nombre de bits à transmettre, pair
% t sont les instants d'éch, pair
%%========================================%%

% Calcul du nombre d'instants par bits
instantParBit = floor(length(t)/N);

% Génération de la séquence de bits
sequence = (2*randi(2,1,N))'-3;

symbole = sin(2*pi*f0*t(1:instantParBit,1));

s = (kron(sequence,symbole))';

%% Si on utilise directement les instants non-uniformes

%symbole = zeros(instantParBit,N);

%k = 1;

%for i=1:1:N

%	symbole(:,i) = sin(2*pi*f0*t(k:(k+instantParBit-1)));
%	k=k+1;

%end

%s = [];

%for j=1:N

%	tmp = sequence(j)*symbole(:,j);
%	s = [s ; tmp];

%end

end