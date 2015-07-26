function s = FSK(N,ampl,t_uniforme,f_ech,f0,f1)

% =========================================================================
% Projet industriel 2014 - Échantillonnage non-uniforme
%
% Fonction de génération d'un signal FSK
% 
% t_uniforme = vecteur des instants uniformes
% ampl = aplitude du signal
% N = nombre de symboles
% f_ech = fréquence d'échantillonnage
% f0 = fréquence du bit 0
% f1 = fréquence du bit 1
%
% =========================================================================

% Nombre de points de signal
N_pts = length(t_uniforme);

% Nombre de points par symboles
N_symb = ceil(N_pts/N);

phase = 0;
i = 1;
s = zeros(N_pts,1);

for k = 1:N

    % Création d'un bit aléatoire
    a = [f0;f1];
    f_symbole = a(randi([1 2],1,1));
    
    for l = 1:N_symb
        s(i) = ampl*sin(phase);    

        phase = phase + (2*pi*f_symbole/f_ech);
        i = i + 1;
    end
end

end



