This folder contains the operating panel of PTS-Controller program.
The control logic is written in main.py, and panel setting is written in mainwindow.py.

--------changing panel------------
When you want to change panel, maybe you are trying to add more options, please understand the logic first.
Basically, most of the changes will be reflected on mainwindow.py,
and this file is not written manually but compiled by pyqt4.
So, please follow the procedures below:
1. Download Qt Creater, and open "mainwindow.ui" with it.
2. After finishing the changing, save it and double click "ui2py.bat" to compile.
3. If you fail on the previous step, make sure that you've already download the python package pyqt.
4. If you still fail on step3 after finishing step4,
   edit "ui2py.bat" by changing "C:...pyuis.py" to your "pyuic.py"'s location.
5. Remember to change "main.py" synchronously
6. After finishing compiling, you should be able to operate the panel after double click "start.bat".

-------file explination-----------
1. main.py:         logic control
2. mainwindow.py:   panel control
3. mainwindow.ui:   panel design
4. start.bat:       operator of main program
5. ui2py.bat:       operator of compilation
6. util.py:         one of the package used in "main.py"
7. util.pyc:        compiled file of "util.py", usually can be neglected
