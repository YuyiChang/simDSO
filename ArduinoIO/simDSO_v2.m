% simDSO
% Yuyi Chang
% 01/02/2017

delete(timerfindall);
clear all;
%close all;
delete(instrfindall);
clc;

%Initialize the Arduino
a=arduino('/dev/tty.usbmodem1421');
INPUT_PIN=5;
OUTPUT_PIN=5;
%a.pinMode(INPUT_PIN,'input');
a.pinMode(OUTPUT_PIN,'output');


%Initialize x axis(vector)
INTERVAL=0.001;
ENDZONE=0.2;
x=0:INTERVAL:ENDZONE;
STD_X=x;

%Graph setting
hold on;
title('simDSO')
xlabel('x')
ylabel('y')
grid on
box on
%axis equal
xlim([0,ENDZONE])
ylim([0,6])
set(gca, 'XTick',[0:0.01:ENDZONE]);
set(gca,'YTick',[0:0.1:6])

%Initialize the timmer
tic;
previousTime=toc;

%Initialize the raw function
for i=1:length(x)
    y(i)=0;
end

while 1
    input = a.analogRead(INPUT_PIN)/204.8;      %Scale to 5v
    dev=toc-previousTime;
    
    %User defined output
    a.analogWrite(OUTPUT_PIN,128);
    
    if dev>=0.001  %Change Time Deviation
        ENDZONE=ENDZONE+INTERVAL;
        newX=[x,ENDZONE];
        newY=[y,input];
      
        newX([1])=[];
        newY([1])=[];
        
        x=newX;
        y=newY;
        
        h = plot(STD_X,y,'-b'); %Plot
       
        pause(1E-8);    %Keeps the program runs perfectly
        delete(h);  %Remove previous plotting
        previousTime=toc;   %Reset timmer
    end
end