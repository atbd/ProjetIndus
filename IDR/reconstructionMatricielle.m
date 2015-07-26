function [s_reconst] = reconstructionMatricielle(s, instantsNonUniform, instantsUniform, N_w)

T_moy = mean(diff(instantsNonUniform));
 N_nu = length(instantsNonUniform);
s_reconst = zeros(N_nu,1);


for i = 100:N_nu-100
    
    % Calcul de la fenêtre sur les instants uniformes
    [m,p] = window_find(instantsUniform(i),instantsUniform,N_w);
    
    % On en déduit alors les instants non-uniformes concernés par la
    % fenêtre :
    w = (instantsNonUniform >= instantsUniform(m)) & (instantsNonUniform <= instantsUniform(p));
    
    % Calcul de la matrice de passage  
    Z = kron(ones(1,p-m+1),instantsNonUniform(w))-kron(ones(sum(w),1),(instantsUniform(m:p)'));
    Z = sinc(Z/T_moy);
    s_temp = pinv(Z)*s(w);
    
    % On obtient maintenant la fonction sur les instants uniformes. Le
    % point qui nous intéresse alors est celui au milieu de la fenêtre.
    s_reconst(i,1) = s_temp(floor((m+p)/2)-m+1);
end

end