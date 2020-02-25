%% C�digo para la visualizaci�n y almacenamiento de se�ales ECG a partir de ECG click

%% Limpiar terminales y ventana de comandos 
clc
close all
clear all

%% Identificaci�n del nombre del archivo deseado.

dlgtitle = 'Introduzca el nombre del archivo destino';
dims = [1 60];
definput = {'paciente.txt'};
id = inputdlg('Ejemplo: paciente.txt',dlgtitle,dims,definput);
ID = string(id);

%% Identificaci�n del puerto de comunicaci�n al que se encuentra asociado el arduino
dlgtitle = 'introduzca el puerto COM';
dims = [1 60];
definput = {'COM9'};
puerto = inputdlg('Ejemplo: COM17',dlgtitle,dims,definput);
Puerto = string(puerto);

%% Espicificaciones para la apertura y lectura de la informaci�n de la tarjeta click ECG

delete(instrfind({'Port'},{Puerto})); %Limpieza de datos anteriores
s = serial(Puerto,'BaudRate',9600,'Terminator','CR/LF'); %Conexi�n con el puerto deseado a 9600BAUD
warning('off','MATLAB:serial:fscanf:unsuccessfulRead'); %Advertencia en caso de mala comunicaci�n
fopen(s); %Identificaci�n y apertura de los datos.
data = fscanf(s,'%d')'; % Inicializaci�n de los datos 
i=0; %Inicializaci�n del vector sumador.
A=0; %Inicializaci�n del vector de almacenaje.

%% Configuraci�n que permite la visualizaci�n de la gr�fica

  while data~=9876 %Valor dado para el cierre de comunicaci�n programado en la tarjeta Arduino UNO 
      i=i+1; %Incremento del vector de almacenaje.
      A(i,1) = data; %La variable A almacena los datos medidos por la tarjeta ECG click.
      
%% Espicificaciones para la graficac�n de la informaci�n de la tarjeta click ECG
plot(A,'Color',[0 0.8 0]);
set(gca,'Color','k');
grid on;
set(gca,'GridColor',[0.5 1 0.5]);
hold on
drawnow limitrate nocallbacks
data = fscanf(s,'%d')'; %%Escaneo de infomaci�n de tipo decimal (firmado).
  end
f = msgbox('El medidor ECG se encuentra apagado: MUESTRA FINALIZADA', 'Warning','warn'); 
%warning('El medidor ECG se encuentra apagado: MUESTRA FINALIZADA') %Advertencia 
                                       %en caso de que el instrumento de medida se encuente apagado
 
 %% Almacenamiento del archivo
writematrix(A,ID);%%Datos almacenados a partir de la posici�n B1 de Excel.
 %% Fin.