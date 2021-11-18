# Simulink_Arduino
This repository contains a simulink model and matlab file for building control systems in simulink and deploying them to Arduino Uno.
It is meant to be used with the "flap" setup, but minor adjustments in I/O config can make it appropriate for any similar application

## To Run 

You'll need the following Matlab/Simulink packages, which can be downloaded from Matlab's Add-on manager: 

_Matlab support package for Arduino hardware_

_Simulink support package for Arduino hardware_

The code was made with Matlab 2021a and backwards compatibility is NOT GUARANTEED

Connect you Arduino to the PC. Find out what COM port it's on.

change Matlab's working directory to that of the repo.

Open the simulink model. Under the HARDWARE tab, open hardware settings > Hardwre Implementation > Target Hardware resources > Host-board connection, select the right COM board.

Make sure your motor driver is powered OFF. 

In the HARDWARE tab, click on Build, Deploy & Start

after the build is complete, open the "main.m" script in Matlab and run it. 

After a small delay, it tells you to turn the power on and press Enter. make sure you click somewhere on the command window before pressing Enter. 

Watch out for integrator wind-up. If your code has been running for a while with the actuator powered off and you have integrators in your controller, you will likely see a rapid response when you turn the power on. 
