This program is created by Gilbert Shih, and this explanation is written by Kevin Huang.
The content below will briefly explain how the structure is.
If you aren't familiar with quartus II, please read the tutorial of "verilog" and "fpga_quartusII",
which are in the folder "Tutorial" in github account "UltracoldAtomsLab".

-basic description---------
This is a program composed of controlling panel written in python and fpga files.
The purpose is to set several sets of frequencies into fpga, and control PTS to emit specific RF with fpga.
When using the program, it will follow the processes below:
1. Read the input frequencies entered into pyqt4 panel (created by python).
2. The frequencies will be transform into proper form (BCD code) for fpga by "main.py".
3. FPGA will remember those frequencies and store them.
4. When fpga receives pulses, it'll send specific signal to PTS.
5. After receiving fpga's signal, PTS will emit the targetting frequency RF.

-instruction of use--------
1. Download the whole folder.
2. Open "sequencer_extensions.qpf" with quartus II and compile it directly to get ".sof" file.
3. Convert the ".sof" file that you've created to get ".jic" file.
4. Click the "Programmer" button, after adding the ".jic" file, start the programming to your DE0-nano.
5. Connecting the wires to each pin propperly.
For the relationships between pins and wires, please follow the original setting.
If you are trying to start from scratch, please get yourself familiar with quartus II and "sequencer_extensions.qpf".

-python--------------------
This folder contains files of the controlling panel and the file to create the ".py".
For more instructions please read the "readme.txt" file in "python" folder.

-v------------------------
This folder contains files of the sub-modules.
For more instructions please read the "readme.txt" file in "v" folder.
Don't change the name of "v" unless you are so pro that you don't need this readme.txt file.
