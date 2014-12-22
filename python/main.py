import sys
from PyQt4.QtGui import *
from mainwindow import Ui_mainWindow
import serial
import serial.tools.list_ports
from util import *


class main(QMainWindow, Ui_mainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        self.setupUi(self)
        # serial port initialization
        self.ser = serial.Serial()
        self.ser.setBaudrate(115200)
        self.ser.setStopbits(2)
        self.refresh()
        # link buttons
        self.pushButton_refresh.clicked.connect(self.refresh)
        self.pushButton_SET.clicked.connect(self.set)

    def refresh(self):
        self.comboBox_port_list.clear()
        port_list = [i[0] for i in list(serial.tools.list_ports.comports())]
        self.comboBox_port_list.addItems(port_list)

    def set(self):
        port = str(self.comboBox_port_list.currentText())
        self.ser.setPort(port)
        if not self.ser.isOpen():
            self.ser.open()
        loop = int(self.spinBox.value())
        fedit = int(self.lineEdit_edi.displayText())
        f = int(self.lineEdit_f.displayText())
        df = int(self.lineEdit_df.displayText())
        index = 0
        for i in range(loop):
            if self.checkBox_edi.isChecked():
                self.ser.write(setFreq(index,fedit))
                index +=1
            self.ser.write(setFreq(index,f+i*df))
            index +=1
        self.ser.write(setIndex(0))

app = QApplication(sys.argv)
mainprogram = main()
mainprogram.show()
sys.exit(app.exec_())