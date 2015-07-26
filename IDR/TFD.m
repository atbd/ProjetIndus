function [s,f] = TFD(x,t)

N = length(x);

N_tfd = 2^(nextpow2(N) + 3);

%s = zeros(N_tfd,1);

W = kron([1:N_tfd]',t');
W = exp(-2*j*pi*W*f_ech/N_tfd);

s = (W*x)/N_tfd;

f = linspace(0,f_ech,N_tfd);
end

