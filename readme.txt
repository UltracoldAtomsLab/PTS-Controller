This program is created by Gilbert Shih, and this explanation is written by Kevin Huang.
The content below will briefly explain how the structure is.
For more tutorial about the python please see the readme.txt in floder "python".

--------basic description---------
This is a program composed of controlling panel written in python and fpga files.
The purpose is to set several sets of frequencies into fpga, and control PTS to emit specific RF with fpga.
When using the program, it will follow the processes below:
1. Read the input frequencies entered into pyqt4 panel.
2. The frequencies will be transform to proper form (BCD code) for fpga.
3. FPGA will remember those frequencies and store them.
4. When fpga receives pulses, it'll send specific signal to PTS.
5. After receiving fpga's signal, PTS will emit the targetting frequency RF.

--------instruction of use--------
1. Download the whole folder.
2. Open "sequencer_extensions.qpf" with quartus II and compile it directly to get ".sof" file.
3. Convert the ".sof" file you've created to ".jic" file.
4. Click the "Programmer" button, after adding the ".jic" file, start the programming to your DE0-nano.
5. Connecting the wires to each pin propperly.
For the relationships between pins and wires, please follow the original setting.
If you are trying to start from scratch, please get yourself familiar with the content below first.

--------sequencer_extensions.qpf--------
The main quartus II project.
Seldom will you modify this file unless you want to change the boards from DE0-nano to other fpga boards.
If so, please follow the instructions in this file.

--------sequencer_extensions.qsf--------
The basic setting for this project, which is mainly about the pin connection in the upper part.
The rest of the file is about the description of positions where to find other modules for main module.
If you want to add any module to the main program, please follow the instructions in this file.

--------sequencer_extensions.sdc--------
Some basic setting about the intrinsic timing control.
Seldom will you modify this file unless you are so pro that you don't need this readme.txt file.

--------sequencer_extensions.v----------
Main program which you connect three sub-modules name "async_receiver", "decoder", and "ptsController".
It won't be a hard job for those who are familiar with verilog HDL language.
For more tutorial about verilog, please go to folder "Basic_tutorial" in github account "UltracoldAtomslab".

--------sequencer_extensions.htm--------
Really not an important file.

--------python--------------------------

--------v-------------------------------
