clear
clc
ardPort = serialport("COM3" , 115200);
configureTerminator(ardPort, "CR/LF");
ardPort.UserData = struct('time', [], 'reference', [], 'position', [], 'command', [], 'counter', 1);
ardPort.flush();
pause(1);
disp("Turn the power on")
disp("press Enter to continue")
pause;
%%
configureCallback(ardPort,"terminator", @ardCB);
pause(0.5)
ardPort.write(135, "uint8");
pause(2)
ardPort.write(45, "uint8");
pause(1)
configureCallback(ardPort , 'off')
disp("data collection finished")
disp("Turn the power off")
data = ardPort.UserData;
clear ardPort
%%
close all
figure()
subplot(2 , 1 ,1)
plot(data.time , data.reference, '--');
hold on 
plot(data.time , data.position);
legend ({'reference','position'})
subplot(2 , 1 , 2)
plot(data.time , data.command)
legend command

%%
function ardCB(src, ~)
    msg = char(readline(src));
    src.UserData.time(end+1) = typecast(uint8(msg(1:4)) , 'single');
    src.UserData.reference(end + 1) = typecast(uint8(msg(5:8)), 'single');
    src.UserData.position(end + 1) = typecast(uint8(msg(9:12)), 'single');
    src.UserData.command(end + 1) = typecast(uint8(msg(13:end)), 'single');
    src.UserData.counter = src.UserData.counter + 1;
    
end


