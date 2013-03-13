% Freq/Periodo de amostragem
Fs = 1000;                    
h = 1/Fs;                     
% Comprimento do sinal
N = 1000;       
% Janela temporal
T0=(N-1)*h;
% Vetor de tempo
t = [0:h:T0];                
% Sinal
x1 = 4*sin(2*pi*50*t)+ 10*sin(2*pi*600*t)+0.5*sin(2*pi*400*t); 
figure(1)
%subplot(2,1,1)
plot(1000*t,x1)
%subplot(2,1,2)
%plot(1000*t(1:50),x1(1:50))
xlabel('(ms)')

% Preparando para calcular a DFT
% 1) Resolucao em frequencia
deltaf=1/N/h; % = Fs/N
% 2) Eixo de frequencias [-Fs/2,Fs/2] de deltaf em deltaf
f = Fs/2*linspace(0,1,N/2+1);
DFT=fft(x1);%/N;
%DTFT=4*(1/2)*j*(impulso(em -2*pi*50*h)-impulso(em 2*pi*50*h))
%DTFS=DFT/N
DTFS=DFT/N;
figure(2)
plot(f,2*abs(DTFS(1:N/2+1))) 
title('Espectro de meia-banda')
xlabel('(Hz)')
ylabel('modulo')







