function [ num_amostras ] = calc_max_amostras( angulo, velocidade,fs )
% Fun��o que dado um angulo correspondente a um deslocamento do ve�culo, calcula o n�mero
% m�ximo de amostras compreendidas nesse deslocamento.
% 
% angulo : Medida em graus do intervalo onde a dire��o de chegada ser�
% considerada constante
% velocidade : Velocidade do ve�culo medida em km/h

distancia = 3.6; % Distancia medida em metros entre o ve�culo e o array de microfones 
%fs = 44100; % Frequ�ncia de amostragem em Hz

velocidade = velocidade/3.6; % Velocidade em m/s
deslocamento = angulo*pi*distancia/180; % Dist�ncia em metros percorrida pelo ve�culo no dado intetvalo. Aproxima��o para angulo << 1 rad
t_desloc = (deslocamento/velocidade); % Tempo em segundos decorrido durante o deslocamento
num_amostras = t_desloc*fs;

end

