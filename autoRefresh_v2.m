clc
clear

%Graph setting
hold on;
title('simDSO')
xlabel('x')
ylabel('y')
grid on
box on
%axis equal
xlim([0,2*pi])
ylim([-1.5,1.5])
set(gca, 'XTick',[0:pi/4:2*pi]);
set(gca,'YTick',[-1.5:0.15:1.5])

%Initialize x axis(vector)
interval=pi/32;
endZone=2*pi;
x=0:interval:endZone;
stdX=x;

%Initialize the timmer
tic;
previousTime=toc;

%Initialize the raw function
for i=1:length(x)
    y(i)=sin(x(i));
end

%Change in auto refresh v2:
%Remove moving sin() diagram by using phrase addition
%Use array editing instead
%   Every time, delete the first element in the array, move all elements,
%   add another element in the last position of array.
while 1
    dev=toc-previousTime;
    if dev>=0.1  %Change Time Deviation
        endZone=endZone+interval;
        newX=[x,endZone];
        newY=[y,sin(newX(i+1))];
      
        newX([1])=[];
        newY([1])=[];
        
        x=newX;
        y=newY;
        
        h = plot(stdX,y,'-b'); %Plot
       
        pause(1E-8);    %???? mizhizanting keeps the program runs perfectly
        delete(h);  %Remove previous plotting
        previousTime=toc;   %Reset timmer
    end
end
