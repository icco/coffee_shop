#!/usr/bin/env ruby

# Require Qt4, ruby 1.8 only
require 'Qt4'

# Our base class for storring data
# We still need subclasses for a file and buffer, I think...
class CoffeeText
   # I can never seem to remember this little function name
   attr_accessor :text, :fname

   def initialize filename
      @fname = filename
   end

   def load

   end

   def save
      p @text
   end
end

# this is the big ass text box.
class TextBox < Qt::Widget
   def initialize
      super
      
      file = CoffeeText.new ""

      textb = Qt::TextEdit.new do
         connect(SIGNAL :textChanged) {
            file.text = textb.toPlainText
            file.save
         }
      end
      textb.setAcceptRichText false
      layout = Qt::VBoxLayout.new()
      layout.addWidget(textb)
      setLayout(layout)
   end
end

# Super class for anything in the menu
class MenuItem < Qt::Widget
end

class QuitButton < MenuItem
   def initialize
      # First setup the menuitem
      super 

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

# Go Dog Go
app = Qt::Application.new ARGV

# Create Root Window
widget = FullScreen.new 

# Display
widget.show 

# Run
app.exec 

