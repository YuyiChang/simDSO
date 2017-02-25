clc
clear

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


i=0;
x = 0:0.1:2*pi;
tic;
previousTime=toc;

while 1
    dev=toc-previousTime;
    if dev>=0.01    %Change Time Deviation
        y = sin(x+i*pi/256);    %Phrase change per time
        h = plot(x,y,'-b');
        pause(1E-8);
        delete(h);
        i=i+1;
        previousTime=toc;
    end
end