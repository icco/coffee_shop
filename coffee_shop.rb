#!/usr/bin/env ruby

require 'Qt4'

# http://www.darshancomputing.com/qt4-qtruby-tutorial/chapter_03

class CoffeeText
   def initialize x
      @text = x
   end

   def save
      p @text
   end
end

class TextBox < Qt::Widget
   def initialize
      super
      textb = Qt::TextEdit.new do
         connect(SIGNAL :textChanged) {
            c = CoffeeText.new(textb.toPlainText)
            c.save
         }
      end
      textb.setAcceptRichText false
      layout = Qt::VBoxLayout.new()
      layout.addWidget(textb)
      setLayout(layout)
   end
end

class MenuItem < Qt::Widget
end

class QuitButton < MenuItem
   def initialize
      super # First setup the menuitem

      # Build the button
      # Connect the button to an action
      quit = Qt::PushButton.new('Quit') do
         connect(SIGNAL :clicked) { Qt::Application.instance.quit }
      end
      quit.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))

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

