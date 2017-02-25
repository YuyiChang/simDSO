delete(timerfindall);
clear all;
close all;
delete(instrfindall);
clc;

a=arduino('/dev/tty.usbmodem1411');
%a=arduino('DEMO');


a.pinMode(13,'output');
a.pinMode(3,'output');
%a.digitalWrite(13,1);
tic();
previousTime=0;
state=0;
preState=state;
counter=0;

while(1)
   time=toc();
   if time-previousTime<1
       ledOn(a);
       state=1;
       if preState~= state
           fprintf('LED on\n');
           preState=state;
       end
       %a.digitalWrite(13,1);
       %fprintf('High\n');
   end
   if time-previousTime>1
       ledOff(a);
       state=0;
       if preState~= state
           fprintf('LED off\n');
           preState=state;
           counter=counter+1;
       end
       %a.digitalWrite(13,0);
       %fprintf('LOW\n');
   end
   if time-previousTime>2
       previousTime=time;
   end
   if counter==10
       break
   end
   a.analogWrite(3,128);
end
fprintf('break')
