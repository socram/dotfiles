#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Imports {{{ _#_
import sys
import os
import pyautogui
import time


from PyQt5.QtWidgets import (
    QApplication,
    QGridLayout,
    QHBoxLayout,
    QGraphicsScene,
    QWidget
)

# _#_ }}} 

# Variaveis Globais {{{ _#_
binario='/usr/bin/xdotool'
opacity = 0.25
delta = 20
janelaEmFoco= os.system("xdotool getactivewindow")

print (janelaEmFoco)

# _#_ }}} 




# Mata Versao Anterior se tiver rodando {{{ _#_
command='ps -ef | grep [m]ouse.py | awk "{ print $2 }" | xargs kill -9'

os.system(command)

# _#_ }}} 

# class Window {{{ _#_
class Window(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("MouseLess")

        # Create a QGridLayout instance
        layout = QGridLayout()

        # Set the layout on the application's window
        self.setLayout(layout)

# _#_ }}} 

# tecla digitada {{{ _#_
def widgetKeypress(event):
      key = event.key()

      current_x = pyautogui.position().x
      current_y = pyautogui.position().y
      
      print(str(key)) # print qualquer tecla dentro do widget para add uma funcao para ela

      if ( key == 16777216 ): #esc
         sys.exit()

      if ( key == 65 ): #a
        command = "/usr/bin/xdotool mousemove " + str(current_x - delta) + " " + str(current_y)
        os.system(command)

      if ( key == 68 ): #d
        command = "/usr/bin/xdotool mousemove " + str(current_x + delta) + " " + str(current_y)
        os.system(command)

      if ( key == 87 ): #w
        command = "/usr/bin/xdotool mousemove " + str(current_x) + " " + str(current_y - delta)
        os.system(command)

      if ( key == 83 ): #s
        command = "/usr/bin/xdotool mousemove " + str(current_x) + " " + str(current_y + delta)
        os.system(command)

      if ( key == 32 ): #espaco
        sys.exit()
    

# _#_ }}} 

# Funcao main {{{ _#_
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = Window()
    # window.showFullScreen()
    window.show()
    window.setWindowOpacity(opacity)
    window.keyPressEvent = widgetKeypress

    # voltaParaUltimaJanelaEmFoco="/usr/bin/usr/bin/xdotool windowactivate " + str(janelaEmFoco)
    # os.system(voltaParaUltimaJanelaEmFoco)
    # command = "/usr/bin/xdotool click 1"
    # os.system(command)
    sys.exit(app.exec_())
# _#_ }}} 
