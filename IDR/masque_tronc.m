function [ S_tronc ] = masque_tronc( S,f,f0, B)
% Fonction servant � tronquer le spectre du signal autour de sa fr�quence
%principale

% Inputs : 
%       S : Spectre du signal, fr�quences
%       f : fr�quences relatives aux points de spectre
%       f0 : fr�quence(s) fondamentale(s)
%       B : bande de fr�quence du signal(largeur du filtre)

% Output : 
%       S_tronc : Spectre tronqu�

f01 = max(f0);
freq_haute=f01+B/2;


%cr�ation du masque passe bas
    mask1= f>=-freq_haute;
    mask4= f<= freq_haute;
    mask=mask1.*mask4;% passe bas
    
% troncature du spectre
    S_tronc=S.*mask;
        
end

