function [x,t] = iTFD(s,f)

N = length(s);

N_tfd = 2^(nextpow2(N) + 3);

%s = zeros(N_tfd,1);

W = kron([1:N_tfd]',t');
W = exp(2*j*pi*W*f_ech/N_tfd);

x = W*x;

t = linspace(0,f_ech,N_tfd);
end




