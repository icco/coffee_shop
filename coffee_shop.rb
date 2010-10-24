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

# I moved all of the classes into their sperate files for readability
require 'libs/GlobalSettings'
require 'libs/CoffeeFile'
require 'libs/TextBox'
require 'libs/MenuItem'
require 'libs/Drawer'
require 'libs/ColorButton'
require 'libs/BackgroundButton'
require 'libs/ForegroundButton'
require 'libs/LoadButton'
require 'libs/QuitButton'
require 'libs/SaveButton'
require 'libs/Statistics'


# This is the root class that does all of the setting up and displaying.
class FullScreen < Qt::Widget
   include Singleton
   attr_accessor :file

   def initialize
      super

      # We need to set up all of the settings 
      gs = GlobalSettings.instance;
      gs.files = [];
      gs.currentFile = 0;
      gs.files[gs.currentFile] = CoffeeFile.new ""
      gs.text = TextBox.new

      menu = []

      # Define the file menu layout
      menu[1] = Qt::HBoxLayout.new()
      menu[1].addWidget SaveButton.new
      menu[1].addWidget LoadButton.new
      menu[1].addWidget QuitButton.new
      menu[1].setAlignment Qt::AlignLeft

      # Define the fg color menu
      menu[2] = Qt::HBoxLayout.new()
      menu[2].addWidget ForegroundButton.new
      menu[2].setAlignment Qt::AlignLeft

      # Define the bg color menu
      menu[3] = Qt::HBoxLayout.new()
      menu[3].addWidget BackgroundButton.new
      menu[3].setAlignment Qt::AlignLeft

      menu[4]  = Qt::HBoxLayout.new()
      menu[4].addWidget StatsWidget.new
      menu[4].setAlignment Qt::AlignLeft

      # Layout the right side menus
      menus = Qt::VBoxLayout.new
      menu.each {|m|
         menus.addLayout m if !m.nil?
      }

      menus.setAlignment Qt::AlignTop

      # Layout the textbox
      hbox = Qt::HBoxLayout.new
      hbox.addWidget(gs.text)
      hbox.addLayout(menus)

      # Create right and left side buffers. At some point, I need to make these
      # fit any screen size.
      spacer1 = Qt::SpacerItem.new(300, 100)
      spacer2 = Qt::SpacerItem.new(200, 100)

      # Lay it all out
      grid = Qt::GridLayout.new
      grid.addItem(spacer1, 0, 0)
      grid.addItem(spacer2, 0, 2)
      grid.addLayout(hbox, 0, 1)

      setLayout(grid)

      setWindowTitle "Coffee_Shop"

      setWindowState(Qt::WindowFullScreen)
   end
end

# Create the app, define the style sheet and start the application.
app = Qt::Application.new ARGV
app.setWindowIcon Qt::Icon.new "assets/icons/light_gray/sad.png" 

app.setStyleSheet(GlobalSettings.instance.appStyles)
FullScreen.instance.show 
app.exec 

