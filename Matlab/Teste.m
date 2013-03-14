clear all; close all;
%caso 1: N=512 e resolução - 100 Hz
%Resolução
Res = 100; %Hz                    
% Comprimento do sinal
N = 512;  
% Frequencia de amostragem
Fs = (N-1)*Res;                    
%Periodo de amostragem
h = 1/Fs;      
% Janela temporal
T0 = (N-1)*h; % 1/To = resolução
% Vetor de tempo
t = 0:h:T0;          
%período do sinal
a = 1e-3;
%amplitude do sinal
A = 1;
t1 = -T0/2:h:T0/2;
%Sinal no tempo
x = zeros(1,N);

for i=1:N
    x(i) = xt(t1(i), a, A);
end
figure(1)
plot(t1,x) %Sinal original

xshift=circshift(x',N/2);

figure(2)
plot(t,xshift) %sinal shiftado


% Preparando para calcular a DFT
% 1) Resolucao em frequencia
deltaf=Res; % = Fs/N
% 2) Eixo de frequencias [-Fs/2,Fs/2] de deltaf em deltaf
f = Fs/2*linspace(0,1,N/2+1);
DFT=fft(xshift);%/N;
%DTFT=4*(1/2)*j*(impulso(em -2*pi*50*h)-impulso(em 2*pi*50*h))
%DTFS=DFT/N
%DTFS=DFT/N;
figure(3)
FT = zeros(1, N/2+1);
for i=1:N/2+1
    FT(i) = X(f(i),a,A);
end
DFTUNSHIFT = DFT / exp(1i*pi*Fs);
plot(f, abs(FT)/h, f, abs(DFTUNSHIFT(1:N/2+1)), '.')
title('Espectro de meia-banda')
xlabel('(Hz)')
ylabel('modulo')

figure(4)
plot(f, angle(DFTUNSHIFT(1:N/2+1))*180 / pi, '.', f, angle(FT)*180/pi/h)
title('Fase')
xlabel('(Hz)')
ylabel('Graus')
