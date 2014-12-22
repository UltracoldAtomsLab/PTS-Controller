# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'mainwindow.ui'
#
# Created: Mon Dec 22 12:41:26 2014
#      by: PyQt4 UI code generator 4.11
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_mainWindow(object):
    def setupUi(self, mainWindow):
        mainWindow.setObjectName(_fromUtf8("mainWindow"))
        mainWindow.resize(400, 304)
        self.centralWidget = QtGui.QWidget(mainWindow)
        self.centralWidget.setObjectName(_fromUtf8("centralWidget"))
        self.lineEdit_f = QtGui.QLineEdit(self.centralWidget)
        self.lineEdit_f.setGeometry(QtCore.QRect(120, 100, 113, 20))
        self.lineEdit_f.setObjectName(_fromUtf8("lineEdit_f"))
        self.lineEdit_df = QtGui.QLineEdit(self.centralWidget)
        self.lineEdit_df.setGeometry(QtCore.QRect(120, 130, 113, 20))
        self.lineEdit_df.setObjectName(_fromUtf8("lineEdit_df"))
        self.label_2 = QtGui.QLabel(self.centralWidget)
        self.label_2.setGeometry(QtCore.QRect(10, 130, 81, 20))
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.label_3 = QtGui.QLabel(self.centralWidget)
        self.label_3.setGeometry(QtCore.QRect(10, 100, 81, 20))
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.label_4 = QtGui.QLabel(self.centralWidget)
        self.label_4.setGeometry(QtCore.QRect(250, 100, 21, 20))
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.label_5 = QtGui.QLabel(self.centralWidget)
        self.label_5.setGeometry(QtCore.QRect(250, 130, 21, 20))
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.pushButton_SET = QtGui.QPushButton(self.centralWidget)
        self.pushButton_SET.setGeometry(QtCore.QRect(230, 200, 75, 23))
        self.pushButton_SET.setObjectName(_fromUtf8("pushButton_SET"))
        self.comboBox_port_list = QtGui.QComboBox(self.centralWidget)
        self.comboBox_port_list.setGeometry(QtCore.QRect(70, 20, 121, 22))
        self.comboBox_port_list.setObjectName(_fromUtf8("comboBox_port_list"))
        self.label_6 = QtGui.QLabel(self.centralWidget)
        self.label_6.setGeometry(QtCore.QRect(10, 20, 61, 20))
        self.label_6.setObjectName(_fromUtf8("label_6"))
        self.pushButton_refresh = QtGui.QPushButton(self.centralWidget)
        self.pushButton_refresh.setGeometry(QtCore.QRect(200, 20, 75, 23))
        self.pushButton_refresh.setObjectName(_fromUtf8("pushButton_refresh"))
        self.label = QtGui.QLabel(self.centralWidget)
        self.label.setGeometry(QtCore.QRect(230, 230, 171, 16))
        self.label.setObjectName(_fromUtf8("label"))
        self.label_7 = QtGui.QLabel(self.centralWidget)
        self.label_7.setGeometry(QtCore.QRect(10, 150, 351, 41))
        self.label_7.setObjectName(_fromUtf8("label_7"))
        self.lineEdit_edi = QtGui.QLineEdit(self.centralWidget)
        self.lineEdit_edi.setGeometry(QtCore.QRect(120, 70, 113, 20))
        self.lineEdit_edi.setObjectName(_fromUtf8("lineEdit_edi"))
        self.label_8 = QtGui.QLabel(self.centralWidget)
        self.label_8.setGeometry(QtCore.QRect(250, 70, 21, 20))
        self.label_8.setObjectName(_fromUtf8("label_8"))
        self.label_9 = QtGui.QLabel(self.centralWidget)
        self.label_9.setGeometry(QtCore.QRect(10, 70, 81, 20))
        self.label_9.setObjectName(_fromUtf8("label_9"))
        self.checkBox_edi = QtGui.QCheckBox(self.centralWidget)
        self.checkBox_edi.setGeometry(QtCore.QRect(280, 70, 73, 16))
        self.checkBox_edi.setObjectName(_fromUtf8("checkBox_edi"))
        self.spinBox = QtGui.QSpinBox(self.centralWidget)
        self.spinBox.setGeometry(QtCore.QRect(350, 20, 42, 22))
        self.spinBox.setMaximum(1000)
        self.spinBox.setProperty("value", 1)
        self.spinBox.setObjectName(_fromUtf8("spinBox"))
        self.label_10 = QtGui.QLabel(self.centralWidget)
        self.label_10.setGeometry(QtCore.QRect(300, 20, 41, 20))
        self.label_10.setObjectName(_fromUtf8("label_10"))
        mainWindow.setCentralWidget(self.centralWidget)
        self.menuBar = QtGui.QMenuBar(mainWindow)
        self.menuBar.setGeometry(QtCore.QRect(0, 0, 400, 22))
        self.menuBar.setObjectName(_fromUtf8("menuBar"))
        mainWindow.setMenuBar(self.menuBar)
        self.mainToolBar = QtGui.QToolBar(mainWindow)
        self.mainToolBar.setEnabled(True)
        self.mainToolBar.setObjectName(_fromUtf8("mainToolBar"))
        mainWindow.addToolBar(QtCore.Qt.TopToolBarArea, self.mainToolBar)
        self.statusBar = QtGui.QStatusBar(mainWindow)
        self.statusBar.setObjectName(_fromUtf8("statusBar"))
        mainWindow.setStatusBar(self.statusBar)

        self.retranslateUi(mainWindow)
        QtCore.QMetaObject.connectSlotsByName(mainWindow)

    def retranslateUi(self, mainWindow):
        mainWindow.setWindowTitle(_translate("mainWindow", "RF Controller", None))
        self.label_2.setText(_translate("mainWindow", "frequency change", None))
        self.label_3.setText(_translate("mainWindow", "initial frequency", None))
        self.label_4.setText(_translate("mainWindow", "kHz", None))
        self.label_5.setText(_translate("mainWindow", "kHz", None))
        self.pushButton_SET.setText(_translate("mainWindow", "SET", None))
        self.label_6.setText(_translate("mainWindow", "serial port:", None))
        self.pushButton_refresh.setText(_translate("mainWindow", "Refresh", None))
        self.label.setText(_translate("mainWindow", "Chung-You Shih @ lab107 IAMS", None))
        self.label_7.setText(_translate("mainWindow", "[NOTE] The SET comment can be used only at trigger = 0 (off).", None))
        self.label_8.setText(_translate("mainWindow", "kHz", None))
        self.label_9.setText(_translate("mainWindow", "editing frequency", None))
        self.checkBox_edi.setText(_translate("mainWindow", "use?", None))
        self.label_10.setText(_translate("mainWindow", "loop:", None))

