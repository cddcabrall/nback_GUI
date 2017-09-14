# nback_GUI
Application information

nback_GUI v 1.0 (June 5th, 2017)

Christopher Donald Douglas Cabrall
c.d.d.cabrall@tudelft.nl
TUDelft Human Factors of Automated Driving

Customizable N-Back GUI secondary task

A flexible programmable secondary task is provided as a modified version of N-Back. This GUI allows the experimenter to setup a visual manual N-back task that requires participants to key in responses when presented with a prompt "?????" asking them what was the target number seen 1 time, 2 times, or 3 times ago. Automatic scoring and auditory feedback is pre-programmed for correct and incorrect responses. The experimenter can customize the target values, intervals between targets, and amount of targets, and/or pre-load a provided set. Various display information items can be toggled on/off including: a running score, the last number the user responded with, the correct answer (whether from 1, 2, or 3 times ago), the table of target intervals and target values. From such customizable features, this N-Back secondary task can be adjusted in terms of difficulty/ease as needed (e.g., with more or less burden on memory). 

This application was developed while receiving support from the European Commission Seventh Framework Programme as a Marie-Curie Initial Training Network project HFAuto (Human Factors of Automated Driving) PITN-GA-2013-605817

******************************************************************
******************************************************************

A. Introductory notes
A date and time stamped output file in MATLAB format (e.g., log_NBT_2017_6_5_18_49_3.mat) should be automatically generated but ONLY after you use the internal button labeled "Exit" to terminate the program. Use the "Setup Controls" toggle button in the top left corner to customize different settings, and to access the "Start' and "Exit" buttons. If you have any questions, feedback, and/or requests, you may try to contact me on c.d.d.cabrall@tudelft.nl. I hope you enjoy and that this GUI might be useful to you and your research!
- Christopher D.D. Cabrall

B. Output file details
The output results log contains a single MATLAB structure array object called "res" with 8 sub-field variables
1) pnum = participant number
2) condition = experimental condition code
3) intervalsAndTargets = the table of target intervals and values
4) targetChangeTimes = times at which the target changed
5) outResponses = responses that were "counted" from the participant against the correct answer
6) outResponsesTimes = response entry times (e.g., reaction times)
7) runningScore = useful to determine (e.g., plot) how the participant score varied over time across the trial
8) finalScore = a final score
note: the first several targets are intentionally not scored and are presented/considered as "practice" only

C. Credit/Acknowledgements
This application was developed while receiving support from the European Commission Seventh Framework Programme as a Marie Curie Action Initial Training Network project called HFAuto (Human Factors of Automated Driving) PITN-GA-2013-605817. 
  
******************************************************************
******************************************************************

MATLAB Compiler

1. Prerequisites for Deployment 

. Verify the MATLAB Runtime is installed and ensure you    
  have installed version 9.0 (R2015b).   

. If the MATLAB Runtime is not installed, do the following:
  (1) enter
  
      >>mcrinstaller
      
      at MATLAB prompt. The MCRINSTALLER command displays the 
      location of the MATLAB Runtime installer.

  (2) run the MATLAB Runtime installer.

Or download the Windows 64-bit version of the MATLAB Runtime for R2015b 
from the MathWorks Web site by navigating to

   http://www.mathworks.com/products/compiler/mcr/index.html
   
   
For more information about the MATLAB Runtime and the MATLAB Runtime installer, see 
Package and Distribute in the MATLAB Compiler documentation  
in the MathWorks Documentation Center.    


NOTE: You will need administrator rights to run MCRInstaller. 


2. Files to Deploy and Package

Files to package for Standalone 
================================
-nback_GUI.ctf (component technology file)
-nback_GUI.exe
-MCRInstaller.exe 
   -if end users are unable to download the MATLAB Runtime using the above  
    link, include it when building your component by clicking 
    the "Runtime downloaded from web" link in the Deployment Tool
-This readme file 

3. Definitions

For information on deployment terminology, go to 
http://www.mathworks.com/help. Select MATLAB Compiler >   
Getting Started > About Application Deployment > 
Deployment Product Terms in the MathWorks Documentation 
Center.





