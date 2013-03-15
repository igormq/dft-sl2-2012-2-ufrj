clear all; close all;
% Freq/Periodo de amostragem
h = 0.5;
h2 = 0.05;
h3 = 0.4;
Fs = 1/h;
Fs2 = 1/h2;
Fs3 = 1/h3;
% Comprimento do sinal
N = 64;
N2 = 64;
N3 = 1024;
% Janela temporal
T0 = (N-1)*h;
T02 = (N2-1)*h2;
T03 = (N3-1)*h3;
% Vetor de tempo
t = [-T0/2:h:T0/2];                
t2 = [-T02/2:h2:T02/2];
t3 = [-T03/2:h3:T03/2];
% Sinal
for i=1:N,
    x(i)=sinal2(t(i));
end

for i=1:N2,
    x2(i)=sinal2(t2(i));
end

for i=1:N3,
    x3(i)=sinal2(t3(i));
end

xshift=circshift(x',(N/2+1));
x2shift=circshift(x2',(N/2+1));
x3shift=circshift(x3',(N/2+1));

%Resoluções em frequência e eixos das frequências
deltaf=1/N/h;
deltaf2=1/N2/h2;
deltaf3=1/N3/h3;
f = Fs/2*linspace(0,1,N/2+1);
f2 = Fs2/2*linspace(0,1,N2/2+1);
f3 = Fs3/2*linspace(0,1,N3/2+1);

DFT=fft(xshift);
DTFS=DFT/N;
figure;
plot(f,2*abs(DTFS(1:N/2+1)));
title(sprintf('Espectro de meia-banda Fs = %dHz, N = %d', Fs, N));
xlabel('(Hz)');
ylabel('modulo');

DFT2=fft(x2shift);
DTFS2=DFT2/N2;
figure;
plot(f2,2*abs(DTFS2(1:N2/2+1)));
title(sprintf('Espectro de meia-banda Fs = %dHz, N = %d', Fs2, N2));
xlabel('(Hz)');
ylabel('modulo');

DFT3=fft(x3shift);
DTFS3=DFT3/N3;
figure;
plot(f3,2*abs(DTFS3(1:N3/2+1)));
title(sprintf('Espectro de meia-banda Fs = %dHz, N = %d', Fs3, N3));
xlabel('(Hz)');
ylabel('modulo');

%Comparação entre DFT e FT
%DFT*h = FT;
FT = X2(f);
figure;
plot(f,FT,'r');
hold on;
plot(f,abs(h*DFT(1:N/2+1)));
title(sprintf('FT e DFT Fs = %dHz, N = %d', Fs, N));
xlabel('Hz');
ylabel('modulo');

FT2 = X2(f2);
figure;
plot(f2,FT2,'r');
hold on;
plot(f2,abs(h2*DFT2(1:N2/2+1)),'r.');
title(sprintf('FT e DFT Fs = %dHz, N = %d', Fs2, N2));
xlabel('Hz');
ylabel('modulo');

FT3 = X2(f3);
figure;
plot(f3,FT3,'r');
hold on;
plot(f3,abs(h3*DFT3(1:N3/2+1)));
title(sprintf('FT e DFT Fs = %dHz, N = %d', Fs3, N3));
xlabel('Hz');
ylabel('modulo');