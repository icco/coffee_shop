#!/usr/bin/env ruby

# **coffee_shop** is an implementation of [writeroom][wr] in ruby for Linux. It
# was written by Nathaniel Welch for his senior project at Cal Poly. 
#
# The program's goal is to be small, lightweight and distraction free.
# 
# Some of it's main features are:
#
#  * open, edit and save text files
#  * provide a simplistic UI to keep the user focused on writing
# 
# Anyway, enough of my babbling. Lets take a look at the code.
#
# [wr]: http://www.hogbaysoftware.com/products/writeroom

# First off we need to require Qt4. It sadly only works with ruby 1.8.
require 'Qt4'
require 'singleton'

# Next we define this class, which is a singleton for storing configuration
# data that needs to be passed around the program. 
class GlobalSettings
   include Singleton
   attr_accessor :files, :currentFile, :text

   def file
      return @files[@currentFile]
   end

   def file=(a)
      @files[@currentFile] = a
   end

   def appStyles
      return <<-GLOBAL
         * {
            background-color: #fff;
            color: #cccccc;
         }
      GLOBAL
   end
end

# A class to represent something on disk.
class CoffeeFile
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
         GlobalSettings.instance.text.text = @text
      end

      return @text
   end

   def save mode
      if !@lastsave.nil? and (Time.new - @lastsave > 1)
         # Surprise surprise, we only want to save when we have a filename.
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

         file = File.new(@fname, 'w')
         file.write @text
         @changed = false
         # If we don't close, the file won't actually save until prgm death
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
      gs = GlobalSettings.instance
      @tb = Qt::PlainTextEdit.new 
      @tb.connect(SIGNAL :textChanged) {
         gs.file.text = @tb.toPlainText
         gs.file.save 'auto'
      }

      setGeometry(10, 10, 10, 10)
      layout = Qt::VBoxLayout.new()
      layout.addWidget(@tb)
      setLayout(layout)
   end

   def text= txt
      @tb.setPlainText txt
   end
end

# Super class for anything in the menu
class MenuItem < Qt::Widget
   def initialize
      super

      # Now that we know about stylesheets, we can save a string that all
      # MenuItems can use to style themselves. It's kind of amazing really.
      @menuStyle = <<-STYLE
      QPushButton {
         border: none;
         width:  20px;
         height: 20px;
      }
      STYLE
   end
end

class SaveButton < MenuItem
   def initialize
      super 

      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/png/black/64x64/save.png'
      label = "Save"

      but = Qt::PushButton.new(icon, "") do
         connect(SIGNAL :clicked) { gs.file.save 'click' }
      end
      but.setStyleSheet(@menuStyle);
      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
end

class LoadButton < MenuItem
   def initialize
      super 
      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/png/black/64x64/open.png'
      label = "Load"

      but = Qt::PushButton.new(icon, "") do
         connect(SIGNAL :clicked) {
            if (gs.files[gs.currentFile].changed)
               gs.file.save 'auto'
            end

            gs.file.load Qt::FileDialog.getOpenFileName()
         }
      end
      but.setStyleSheet(@menuStyle);

      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
end


class QuitButton < MenuItem
   def initialize
      # First setup the menuitem
      super 


      icon  = Qt::Icon.new 'assets/icons/png/black/64x64/close.png'
      label = "Quit"

      # Build the button
      # Connect the button to an action
      quit = Qt::PushButton.new(icon, "") do
         connect(SIGNAL :clicked) { Qt::Application.instance.quit }
      end
      quit.setStyleSheet(@menuStyle);

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

      gs = GlobalSettings.instance;
      gs.files = [];
      gs.currentFile = 0;
      gs.files[gs.currentFile] = CoffeeFile.new ""
      gs.text = TextBox.new

      menu1 = Qt::HBoxLayout.new()
      menu1.addWidget SaveButton.new
      menu1.addWidget LoadButton.new
      menu1.addWidget QuitButton.new

      menus = Qt::VBoxLayout.new
      menus.addLayout menu1

      grid = Qt::GridLayout.new
      grid.addWidget(gs.text, 0, 0)
      grid.addLayout(menus, 0, 1)
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
app.setStyleSheet(GlobalSettings.instance.appStyles)

# Create Root Window
widget = FullScreen.new 

# Display
widget.show 

# Run
app.exec 

