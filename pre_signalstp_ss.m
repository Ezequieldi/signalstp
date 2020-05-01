%Este archivo es el previo al compartido a Maximiliano.

function [ sinesweep ] = sinesweep( fs,T,W1,W2,R )
%Ingresa frecuencia de sampleo, duracion, frecuencia inicial y final.
%Devuelve un sine.wav
    Play=1;
    fs=44100; %Frecuencia de sampleo
    T=10; %Tiempo de duracion
    w1=1000; %Frecuencia inicial
    w2=2000; %Frecuencia final
    n=[0:1/fs:T]; %Vector de muestras
    z = [w1:1:w2]; %Recorro el vector frecuencias
    subplot(2,1,1);
    y=sinesweep(T,w1,w2,n); %Aplico la funcion pre-definida
    plot(n,y)
    subplot(2,1,2);
    b = inversefilter(T,w2,w1,n) .* sinesweep(T,w2,w1,n); %Aplico el filtro inverso
    plot(n,b)
    audiowrite('sine.wav',y,fs)
    sound(0.02.*y,fs) 
    
      if Play == 1
        sound(0.02.*y,fs) 
      end
    
end

