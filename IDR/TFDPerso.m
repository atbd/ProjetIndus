function [f,s]=TFDPerso(x, t, f_ech, N)
%%
%	Description fonction :
% N : nombre de points
% f_ech : frequence echantillonnage signal
% x : signal
% t : instants d'échantillonnage
%%

N_tfd = 2^(nextpow2(N) + 3);

s = zeros(N_tfd,1);

for n = 1:N_tfd

    for k = 1:N
        s(n) = s(n) + (x(k)*exp(-2*j*pi*n*t(k)*f_ech/N_tfd));
    end    

    s(n) = (1/N_tfd)*s(n);
end

f = linspace(0,f_ech,N_tfd);

end