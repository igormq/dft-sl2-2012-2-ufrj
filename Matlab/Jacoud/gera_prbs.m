h=1/1000;
t_max=10;
fmax=10;
delta_min=1/(2*fmax);


t=[0:h:t_max-h]';

% n_pontos,tipo,banda,nivel do sinal
prbs=idinput(t_max/h,'PRBS',[0 h/delta_min],[-1 1]);

figure(1)
plot(t,prbs)
grid

figure(2)
prbsf=plotfft(prbs,1/h,fmax);
grid

% Sinal para ser exportado para o simulink
prbs_data=[t prbs];