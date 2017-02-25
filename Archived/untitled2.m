clc
clear

tic;
previousTime=toc;
i=0;
fprintf('Start\n')

x=linspace(0,10,200);
y=sin(x);
figure(1)
p=plot(x,y);
hold on

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
        i=i+1;
    end
end