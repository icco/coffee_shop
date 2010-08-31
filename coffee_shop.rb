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
   attr_accessor :text, :files, :currentFile, :bgColor, :fgColor

   def file
      return @files[@currentFile]
   end

   def file=(a)
      @files[@currentFile] = a
   end

   def app
      return Qt::Application.instance
   end

   def refresh
      app.setStyleSheet(appStyles)
   end

   def appStyles
      @bgColor = '#FFF' if @bgColor.nil?
      @fgColor = '#000' if @fgColor.nil?

      return <<-GLOBAL
         QVBoxLayout {
            background-color: #{@bgColor};
         }

         QPlainTextEdit {
            color: #{@fgColor};
            border: 1px solid #{@fgColor}; 
         }
      GLOBAL
   end

end

# A class to represent something on disk.
class CoffeeFile
   # I can never seem to remember this little function name
   attr_accessor :fname, :lastsave, :changed
   attr_reader :text, :pageCount

   # Number of characters per page
   @@perPage = 100

   def initialize filename
      @fname = filename
      @pageCount = 1
   end

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

   # When text comes in, we need to recalc pages.
   def text= txt
      @text = txt
      @pageCount = (@text.length.to_f / @@perPage.to_f)
   end

   # This function returns the text of the page requested.
   def page num
      if num < 0 || num > @pageCount
         return nil
      end

      # Instead of doing the math, and doing the offset lookup, we could store
      # the page content in a hash table on change of @text.
      offset = num * @@perPage
      range = offset..(offset+@@perPage)

      return @text[range]
   end
end

class Boxes < Qt::Widget
   def initialize
      super
      layout = Qt::VBoxLayout.new()
      @widgets = []

      (0..GlobalSettings.instance.file.pageCount).each {|n|
         @widgets[n] = build n
         layout.addWidget(@widgets[n])
      }

      setLayout(layout)
   end

   def text= txt
      GlobalSettings.instance.file.text = txt
      (0..GlobalSettings.instance.file.pageCount).each {|n|
         @widgets[n] = build n if @widgets[n].nil?
         @widgets[n].setPlainText GlobalSettings.instance.file.page n
      }
   end

   def text
      t = ""
      @widgets.each {|v| t += v }

      return t
   end

   # Fire off custom signal
   def textChanged
      puts "TEXT CHANGED"
   end

   def get n
      return @wigets[n]
   end

   def build n
      wid = Qt::PlainTextEdit.new 

      wid.connect(SIGNAL :textChanged) {
         textChanged
      }

      wid.setStyleSheet <<-STYLE
         QPlainTextEdit {
         }
      STYLE

      wid.setVerticalScrollBarPolicy Qt::ScrollBarAlwaysOff
      wid.setHorizontalScrollBarPolicy Qt::ScrollBarAlwaysOff

      wid.setFrameShape Qt::Frame::NoFrame

      return wid
   end
end 

class TextBox < Qt::Widget
   def initialize
      super

      gs = GlobalSettings.instance
      @boxes = Boxes.new

      @sa = Qt::ScrollArea.new
      @sa.setFrameShape Qt::Frame::NoFrame

      @sa.setWidget @boxes
      layout = Qt::VBoxLayout.new()
      layout.addWidget(@sa)
      setLayout(layout)
   end

   def text= txt
      @boxes.text = txt
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

class BgColorButton < MenuItem
   def initialize
      super

      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/64x64/add.png'
      label = "Color"

      but = Qt::PushButton.new('Bg') do
         connect(SIGNAL :clicked) { 
            gs.bgColor = Qt::ColorDialog.getColor.name
            gs.refresh
         }
      end

      but.setStyleSheet(@menuStyle);
      
      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
end

class FgColorButton < MenuItem
   def initialize
      super

      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/64x64/add.png'
      label = "Color"

      but = Qt::PushButton.new('Fg') do
         connect(SIGNAL :clicked) { 
            gs.fgColor = Qt::ColorDialog.getColor.name
            gs.refresh
         }
      end
      but.setStyleSheet(@menuStyle);
      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
end


class SaveButton < MenuItem
   def initialize
      super 

      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/64x64/save.png'
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

      icon  = Qt::Icon.new 'assets/icons/black/64x64/open.png'
      label = "Load"

      but = Qt::PushButton.new(icon, "") do
         connect(SIGNAL :clicked) {
            if (gs.file.changed)
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

      icon  = Qt::Icon.new 'assets/icons/black/64x64/close.png'
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
   include Singleton
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
      menu1.setAlignment Qt::AlignLeft

      menu2 = Qt::HBoxLayout.new()
      menu2.addWidget FgColorButton.new
      menu2.addWidget BgColorButton.new
      menu2.setAlignment Qt::AlignLeft

      menus = Qt::VBoxLayout.new
      menus.addLayout menu1
      menus.addLayout menu2
      menus.setAlignment Qt::AlignTop

      hbox = Qt::HBoxLayout.new
      hbox.addWidget(gs.text)
      hbox.addLayout(menus)

      spacer1 = Qt::SpacerItem.new(300, 100)
      spacer2 = Qt::SpacerItem.new(200, 100)

      grid = Qt::GridLayout.new
      grid.addItem(spacer1, 0, 0)
      grid.addItem(spacer2, 0, 2)
      grid.addLayout(hbox, 0, 1)

      setLayout(grid)

      setWindowTitle "Coffee_Shop"

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

# Display
FullScreen.instance.show 

# Run
app.exec 

