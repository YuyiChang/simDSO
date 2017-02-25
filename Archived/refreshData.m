%Refresh Data

clc
clear

x=linspace(0,10,200);
y=sin(x);
figure(1)
p=plot(x,y);
set(gca, 'XTick',[0:0.5:10]);
set(gca,'YTick',[-5:0.5:5])
grid on
box on
axis equal
title('simDSO')
xlabel('x')
ylabel('y')
%% 
    i=2;
    p.XDataSource = 'x';
    p.YDataSource = 'y';
    y = sin(x+(pi/4)*i);
    refreshdata


%% 
tic;
previousTime=toc;
i=0;
fprintf('Start\n')
while(1)
    dev=toc-previousTime;
    if dev>=1
        %fprintf('%i: ',i);
        %fprintf('%.4f\t',dev);
        %fprintf('%.4f\n',previousTime);
        previousTime=toc;
        p.XDataSource = 'x';
        p.YDataSource = 'y';
        y = sin(x+(pi/4)*i);
        refreshdata
        pause(0.1)
        i=i+1;
    end
end

%% 
clc
clear

x = 0:0.1:3*pi;
y = 0.5*sin(x)+1;
plot(x,y);
hold on;
h = 0;

for i = 1:10
    y = i*sin(x)+1;
    h = plot(x,y);
    pause(0.1);
    delete(h);
end

    