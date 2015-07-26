function [ S_reconst ] = reconstruction_splines_cubique(t, S, Tmoy)
    t_reconst = (1:length(t))'*Tmoy;
    S_reconst = interp1(t,S,t_reconst,'spline');
end
