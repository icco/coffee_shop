#!/usr/bin/env ruby

require 'Qt4'

# http://www.darshancomputing.com/qt4-qtruby-tutorial/chapter_03

class TextBox < Qt::Widget
end

class MenuItem < Qt::Widget
end

class QuitButton < MenuItem
   def initialize()
      super() # First setup the menuitme

      # Build the button
      quit = Qt::PushButton.new('Quit')
      quit.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))

      # Connect the button to an action
      connect(quit, SIGNAL('clicked()'), $qApp, SLOT('quit()'))

      # Lay the button out
      layout = Qt::VBoxLayout.new()
      layout.addWidget(quit)
      setLayout(layout)
   end
end

class FullScreen < Qt::Widget
   def initialize()
      super()
      grid = Qt::GridLayout.new()

      for row in 0..2
         for column in 0..2
            grid.addWidget(QuitButton.new, row, column)
         end
      end

      layout = Qt::VBoxLayout.new()
      layout.addLayout(grid)
      setLayout(layout)

      setWindowState(Qt::WindowFullScreen)
   end
end

app = Qt::Application.new(ARGV)

widget = FullScreen.new() # Create Root Window
widget.show() # Display
app.exec() # Run

