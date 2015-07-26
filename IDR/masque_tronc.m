function [ S_tronc ] = masque_tronc( S,f,f0, B)
% Fonction servant à tronquer le spectre du signal autour de sa fréquence
%principale

% Inputs : 
%       S : Spectre du signal, fréquences
%       f : fréquences relatives aux points de spectre
%       f0 : fréquence(s) fondamentale(s)
%       B : bande de fréquence du signal(largeur du filtre)

% Output : 
%       S_tronc : Spectre tronqué

f01 = max(f0);
freq_haute=f01+B/2;


%création du masque passe bas
    mask1= f>=-freq_haute;
    mask4= f<= freq_haute;
    mask=mask1.*mask4;% passe bas
    
% troncature du spectre
    S_tronc=S.*mask;
        
end

