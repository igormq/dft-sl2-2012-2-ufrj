clear all; close all;
%Teste de shift circular
A = [0:5 4:-1:0 0 0 0 0 0];
B = [0 0 0 0 0 0:5 4:-1:0];
Ak = fft(A);
Bk = fft(B);

n = 0;
for k=1:16,
n = n + Bk(k) == exp(1i*2*pi*5*k/16)*Ak(k);
end

n==0

%Sinal triangular
%Amplitude
A = 5;
%Largura
a = 20;
%Numero de amostras
N = 512;
%Frequencia de amostragem em Hz
fs = 12;

u = zeros(1,N);
for k = 0:N-1,
    t = k/fs;
    u(k+1) = 2*max(0,min(A*t/2/a,A-A*t/2/a));
end;
%Sinal shiftado
plot([1:N]/fs,u);
f = [1:N]*fs/N;
%FFT do sinal shiftado (como voltar ao original?)
figure; plot(f,abs(fft(u)),'k.-');
%FT do sinal sem shift
hold; plot(f,abs(X(5,20,f)),'r.-');