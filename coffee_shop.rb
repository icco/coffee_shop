#!/usr/bin/env ruby

require 'Qt4'

# http://www.darshancomputing.com/qt4-qtruby-tutorial/chapter_03
app = Qt::Application.new(ARGV)

quit = Qt::PushButton.new('Quit')
quit.resize(75, 30)
quit.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))

Qt::Object.connect(quit, SIGNAL('clicked()'), app, SLOT('quit()'))

quit.show()
app.exec()


