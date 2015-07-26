function [y] = reconstructionLagrange(tempsUniform, tempsNonUniform, signalAReconstruire)

for i = 1:length(tempsUniform)
    [m,p] = window_find(tempsUniform(i),tempsNonUniform,20);
    y(i) = r(signalAReconstruire(m:p),tempsNonUniform(m:p),tempsUniform(i));
end

end