#!/usr/bin/env ruby

require 'Qt4'

# http://www.darshancomputing.com/qt4-qtruby-tutorial/chapter_03

class TextBox < Qt::TextEdit
   def initialize
      super
      setAcceptRichText false
   end
end

class MenuItem < Qt::Widget
end

class QuitButton < MenuItem
   def initialize
      super # First setup the menuitem

      # Build the button
      quit = Qt::PushButton.new('Q')
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
   def initialize
      super
      layout = Qt::VBoxLayout.new()
      layout.addWidget QuitButton.new
      layout.addWidget QuitButton.new
      layout.addWidget QuitButton.new
      layout.addWidget QuitButton.new
      grid = Qt::GridLayout.new
      grid.addWidget(TextBox.new, 0, 0)
      grid.addLayout(layout, 0, 1)
      setLayout(grid)

      setWindowState(Qt::WindowFullScreen)
   end
end

app = Qt::Application.new ARGV

widget = FullScreen.new # Create Root Window
widget.show # Display
app.exec # Run

