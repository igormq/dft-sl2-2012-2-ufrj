clear all; close all;
%caso 1: N=512 e resolução - 100 Hz
% Freq/Periodo de amostragem
Fs = 100;                    
h = 1/Fs;                     
% Comprimento do sinal
N = 512;       
% Janela temporal
T0 = (N-1)*h;
% Vetor de tempo
t = 0:h:T0;          
%período do sinal
a = 1e-3;
%amplitude do sinal
A = 1;

t1 = -T0/2:h:T0/2;
%Sinal no tempo
figure(1)
x = zeros(1,N);
for i=1:N
    x(i) = xt(t1(i), a, A);
end
plot(t1,x)