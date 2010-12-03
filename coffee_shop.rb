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
# TODO: there is a way to make ruby autoload smarter...
require 'libs/GlobalSettings'
require 'libs/CoffeeFile'
require 'libs/TextBox'
require 'libs/Menu'
require 'libs/MenuItem'
require 'libs/Drawer'
require 'libs/ColorButton'
require 'libs/FontButton'
require 'libs/LoadButton'
require 'libs/PrintButton'
require 'libs/QuitButton'
require 'libs/SaveButton'
require 'libs/StatsWidget'

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

      # Layout the textbox
      menu = Menu.new
      hbox = Qt::HBoxLayout.new
      hbox.addStretch 0
      hbox.addStretch 0
      hbox.addWidget(gs.text)
      hbox.addWidget(menu)
      hbox.addStretch 0

      # Lay it all out
      grid = Qt::GridLayout.new
      grid.addLayout(hbox, 0, 1)

      setLayout(grid)

      setWindowTitle "Coffee_Shop"

      setWindowState(Qt::WindowFullScreen)
   end
end

# Create the app, define the style sheet and start the application.
app = Qt::Application.new ARGV
app.setWindowIcon Qt::Icon.new "assets/icons/icon.png" 

# Splash Screen init
ss_icon = Qt::Pixmap.new "assets/splash.png"
ss = Qt::SplashScreen.new(ss_icon)
ss.show

GlobalSettings.instance.load
FullScreen.instance.show 
app.setStyleSheet GlobalSettings.instance.appStyles

sleep 1 

ss.finish(FullScreen.instance)

app.exec 
