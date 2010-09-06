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
require './libs/Boxes'
require './libs/TextBox'
require './libs/MenuItem'
require './libs/Buttons'

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

# Go Dog Go
app = Qt::Application.new ARGV
app.setStyleSheet(GlobalSettings.instance.appStyles)

# Display
FullScreen.instance.show 

# Run
app.exec 

