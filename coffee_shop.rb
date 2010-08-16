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
      if @fname.empty
         log "Empty filename, could not load"
      else
         file = File.new(@fname, 'r')
         @text = file.read
         file.close
      end

      return @text
   end

   def save
      if !@fname.empty?
         # Surprise surprise, we only want to save when we have a filename.
         file = File.new(@fname, 'w')
         file.write @text
         # If we don't close, the file won't actually save until the program dies
         file.close
      else
         # Maybe popup a box and ask if they would like to save?
         log "Not Saving: filename empty"
      end
   end
end

# this is the big ass text box.
class TextBox < Qt::Widget
   def initialize
      super
      
      file = CoffeeText.new "test.txt"

      textb = Qt::PlainTextEdit.new do
         connect(SIGNAL :textChanged) {
            file.text = textb.toPlainText
            file.save
         }
      end
      setGeometry(10, 10, 10, 10)
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
      grid.addWidget(TextBox.new, 1, 0)
      grid.addWidget(TextBox.new, 2, 0)
      grid.addLayout(layout, 0, 1)
      setLayout(grid)

      setWindowState(Qt::WindowFullScreen)
   end
end

# A standard "log" format.
def log text
   tFormat = "[%m/%d/%Y %H:%M:%S]: "
   t = Time.new
   puts t.strftime(tFormat) + text 
end

# Go Dog Go
app = Qt::Application.new ARGV

# Create Root Window
widget = FullScreen.new 

# Display
widget.show 

# Run
app.exec 

