#!/usr/bin/env ruby

# Require Qt4, ruby 1.8 only
require 'Qt4'
require 'singleton'

# Global settings
class GlobalSettings
   include Singleton
   attr_accessor :file
end

# Our base class for storring data
# We still need subclasses for a file and buffer, I think...
class CoffeeText
   # I can never seem to remember this little function name
   attr_accessor :text, :fname, :lastsave, :changed

   def initialize filename
      @fname = filename
   end

   # currently I don't know how to put the loaded text back into the editor
   def load filename
      @fname = filename

      if @fname.empty?
         log "Empty filename, could not load"
      else
         file = File.new(@fname, 'r')
         @text = file.read
         @changed = true
         file.close
      end

      return @text
   end

   def save mode
      if !@lastsave.nil? and (Time.new - @lastsave > 1)
         if @fname.empty?
            case mode
            when 'auto'
               #log "Not Saving: filename empty"
               return
            when 'click'
               @fname = Qt::FileDialog.getSaveFileName()
            else
               log "Unknow save mode: #{mode}."
            end
         end

         # Surprise surprise, we only want to save when we have a filename.
         file = File.new(@fname, 'w')
         file.write @text
         @changed = false
         # If we don't close, the file won't actually save until the program dies
         file.close
         @lastsave = Time.new
      else
         @lastsave = Time.at(0)
      end
   end
end

# this is the big ass text box.
class TextBox < Qt::Widget
   def initialize
      super
      textb = Qt::PlainTextEdit.new do
         connect(SIGNAL :textChanged) {
            GlobalSettings.instance.file.text = textb.toPlainText
            GlobalSettings.instance.file.save 'auto'
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

class SaveButton < MenuItem
   def initialize
      super 
      but = Qt::PushButton.new('Save') do
         connect(SIGNAL :clicked) {
            GlobalSettings.instance.file.save 'click'
         }
      end
      but.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))
      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
end

class LoadButton < MenuItem
   def initialize
      super 
      but = Qt::PushButton.new('Load') do
         connect(SIGNAL :clicked) {
            if (GlobalSettings.instance.file.changed)
               GlobalSettings.instance.file.save 'auto'
            end

            GlobalSettings.instance.file.load Qt::FileDialog.getOpenFileName()
         }
      end
      but.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))
      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
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
   attr_accessor :file

   def initialize
      super

      GlobalSettings.instance.file = CoffeeText.new ""
      tb = TextBox.new

      layout = Qt::VBoxLayout.new()
      layout.addWidget QuitButton.new
      layout.addWidget LoadButton.new
      layout.addWidget SaveButton.new
      grid = Qt::GridLayout.new
      grid.addWidget(tb, 0, 0)
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

