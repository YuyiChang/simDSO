delete(timerfindall);
clear all;
close all;
delete(instrfindall);
clc;

a=arduino('/dev/tty.usbmodem1421');
%% 

interval = 2000;
passo = 1;
t = 1;
x = 0;
a.pinMode(3,'output');
tic
while(t<interval)
    %The analog pins are numbered started at 14 (for A0), for Leonardo, UNO
    %a.analogWrite(3,200);
    
    a.analogWrite(44,y)

    b = a.analogRead(5);
    x = [x,b];
    h=plot(x);
    grid
    t = t+passo;
    title('Sim DSO')
    drawnow;
    
end
toc