clear all; close all;
% Freq/Periodo de amostragem
Fs = 100;
Fs2 = 20;
h = 1/Fs;
h2 = 1/Fs2;
% Comprimento do sinal
N = 512;
N2 = 214;
% Janela temporal
T0=(N-1)*h;
T02=(N2-1)*h2;
% Vetor de tempo
t = [-T0/2:h:T0/2];                
t2 = [-T02/2:h2:T02/2];
% Sinal
for i=1:N
    x(i)=sinal1(t(i));
end

for i=1:N2
    x2(i)=sinal1(t2(i));
end

% plot(t,x)
xshift=circshift(x',(N/2+1));
x2shift=circshift(x2',(N/2+1));
% 
% figure;
% plot(0:size(xshift,1)-1,xshift);

%Resoluções em frequência e eixos das frequências
deltaf=1/N/h;
deltaf2=1/N2/h2;
f = Fs/2*linspace(0,1,N/2+1);
f2 = Fs2/2*linspace(0,1,N2/2+1);

DFT=fft(xshift);
DTFS=DFT/N;
figure;
plot(f,2*abs(DTFS(1:N/2+1)));
title('Espectro de meia-banda Fs = 100Hz, N = 512');
xlabel('(Hz)');
ylabel('modulo');

DFT2=fft(x2shift);
DTFS2=DFT2/N;
figure;
plot(f2,2*abs(DTFS2(1:N2/2+1)));
title('Espectro de meia-banda Fs = 20Hz, N = 214');
xlabel('(Hz)');
ylabel('modulo');

%Comparação entre DFT e FT
%DFT*h = FT;
FT = X(f);
figure;
plot(f,FT,'r');
hold on;
plot(f,abs(h*DFT(1:N/2+1)));
title('FT e DFT Fs = 100Hz, N = 512');
xlabel('Hz');
ylabel('modulo');

FT2 = X(f2);
figure;
plot(f2,FT2,'r');
hold on;
plot(f2,abs(h2*DFT2(1:N2/2+1)));
title('FT e DFT Fs = 20Hz, N = 214');
xlabel('Hz');
ylabel('modulo');