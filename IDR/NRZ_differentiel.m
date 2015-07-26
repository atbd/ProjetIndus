function X = NRZ_differentiel( fc,fe)

clc
clear all

N=20;
A=floor(0.5+rand(N,1));

a1 = 1;
a2 = 3;

fc = 20;
fe=200;
t=[1/fe:1/fe:1];
Ts=99;

for n=1 : 2 : length(A)-1 
i=(n+1)/2;
B=A(n)*2+A(n+1);
    switch B
    case 0
         X((i-1)*fe+1:i*fe)=a1;
    case 1
         X((i-1)*fe+1:i*fe)=-a1;
    case 2
        X((i-1)*fe+1:i*fe)=a2;
    case 3
        X((i-1)*fe+1:i*fe)=-a2;
    end
    
end

    
plot(X);
axis([0 2000 -6 6])


