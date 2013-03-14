clear all; close all;
% Freq/Periodo de amostragem
Fs = 10000;                    
h = 1/Fs;                     
% Comprimento do sinal
N = 41;
% Janela temporal
T0=(N-1)*h;
% Vetor de tempo
t = -T0/2:h:T0/2;                
% Sinal
for i=1:N
    x(i)=sinal1(t(i));
end
length(t)
length(x)

figure(1)
plot(t,x)

xshift=circshift(x',(N+1)/2);

figure(2)
plot(0:h:T0,xshift)




