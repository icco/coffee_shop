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
require './libs/GlobalSettings'
require './libs/CoffeeFile'
require './libs/TextBox'
require './libs/MenuItem'
require './libs/Buttons'

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

      # Define the file menu layout
      menu1 = Qt::HBoxLayout.new()
      menu1.addWidget SaveButton.new
      menu1.addWidget LoadButton.new
      menu1.addWidget QuitButton.new
      menu1.setAlignment Qt::AlignLeft

      # Define the color menu layout
      menu2 = Qt::HBoxLayout.new()
      menu2.addWidget Drawer.new
      menu2.addWidget Drawer.new
      menu2.setAlignment Qt::AlignLeft

      # Layout the right side menus
      menus = Qt::VBoxLayout.new
      menus.addLayout menu1
      menus.addLayout menu2
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
app.setStyleSheet(GlobalSettings.instance.appStyles)
FullScreen.instance.show 
app.exec 

