function y = r(x,t_ech,t_eval)
% =========================================================================
% Projet industriel 2014 - �chantillonnage non-uniforme  
% Quentin BIACHE
%
% La fonction 'r' permet d'�valuer la fonction  reconstruite du signal
% x �valu� aux instants d'�chantillonnage non uniformes t_ech suivant la
% formule modifi�e de Lagrange :
% 
%      r(t_eval) = somme[ x(t_ech[k]) f_k(t_eval)/f_k(t_ech[k]), k ]
%
% t_ech contient l'ensemble des instants d'�chantillonnage non-uniforme ;
% t_eval contient l'ensemble des instants pour lesquels on veut �valuer la
% fonction interpol�e.
% =========================================================================


y = zeros(1,length(t_eval));
   
    for j = 1:length(t_ech)
       y = y + x(j).*f_k(t_eval,t_ech,j)./f_k(t_ech(j),t_ech,j);
%        disp('f_k(t_eval)')
%        f_k(t_eval,t_ech,j)
%        
%        disp('f_k(t_ech)')
%        f_k(t_ech(j),t_ech,j)
%        
%        disp('ratio = ')
%        f_k(t_eval,t_ech,j)./f_k(t_ech(j),t_ech,j)
%        
%        disp('===============================')
    end

end

% y = zeros(1,length(t_eval));
% 
% for i = 1:length(t_eval)
%     
%     for j = 1:length(t_ech)
%        y = y + x(j).*f_k(t_eval,t_ech,j)./f_k(t_ech(j),t_ech,j);
%     end
% 
% end
% 
% end

