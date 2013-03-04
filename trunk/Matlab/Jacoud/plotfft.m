function Uf=plotfft(u,fa,fmax)
%fa=1000; % freq amostragem
%t=[0:1/fa:2];
%u=sin(2*pi*10*t);
r=1; %20; % decimacao
f = fa/r; % freq. utilizada na FFT

Uf=fft(u);

w=[0:length(u)-1]*2*pi*f/length(u);


% vetor de frequencias em Hz
Hz=w/2/pi;
% vetor de amplitudes
amp=abs(Uf);

% grafico apenas para frequencias entre 0 e 2fmax
aux=min(find(Hz>=2*fmax));
%semilogx(w/2/pi,abs(Uf));
plot(Hz(1:aux),amp(1:aux));
xlabel('freq (Hz)');
%end