#!/usr/bin/env ruby

require 'Qt4'

# http://www.darshancomputing.com/qt4-qtruby-tutorial/chapter_03
app = Qt::Application.new(ARGV)

window = Qt::Widget.new() # Root Window
window.setWindowState(Qt::WindowFullScreen)

quit = Qt::PushButton.new('Quit', window)
quit.font = Qt::Font.new('Times', 18, Qt::Font::Bold)
quit.setGeometry(10, 40, 180, 40)
Qt::Object.connect(quit, SIGNAL('clicked()'), app, SLOT('quit()'))

window.show()
app.exec()

