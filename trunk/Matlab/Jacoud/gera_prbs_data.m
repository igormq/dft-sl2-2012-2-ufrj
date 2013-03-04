% Entrada exemplo: 
% h=1/1000;t_max=10;fmax=10;
function prbs_data=gera_prbs_data(h,t_max,fmax)

delta_min=1/(2*fmax);
t=[0:h:t_max-h]';



% n_pontos,tipo,banda,nivel do sinal
prbs=idinput(t_max/h,'PRBS',[0 h/delta_min],[-1 1]);

figure(1)
subplot(2,1,1)
plot(t,prbs)
subplot(2,1,2)
prbsf=plotfft(prbs,1/h);
grid


% Sinal para ser exportado para o simulink
prbs_data=[t prbs];


