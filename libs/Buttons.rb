
# This is a button that expands when clicked
class Drawer < MenuItem
   slots 'onclick()'

   def initialize
      super

      @open = false
      icon  = Qt::Icon.new 'assets/icons/black/arrow1_e.png'
      label = "Close"

      @but = Qt::PushButton.new(icon, "")
      @but.setStyleSheet(@menuStyle);

      connect @but, SIGNAL('clicked()'), self, SLOT('onclick()')
      layout = Qt::HBoxLayout.new()
      layout.insertWidget(0, @but)
      setLayout(layout)
   end

   def onclick
      if @open
         self.collapse
      else
         self.expand
      end

      @open = !@open
   end

   def collapse
      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/arrow1_e.png'
      @but = self.layout.itemAt(0).widget
      @but.setIcon icon
      @but.setStyleSheet(@menuStyle);

      (1...self.layout.count).each {|k|
         self.layout.takeAt 1
      }
   end

   def expand
      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/arrow1_w.png'
      @but = self.layout.itemAt(0).widget
      @but.setIcon icon
      @but.setStyleSheet(@menuStyle);
   end
end

class ColorButton < Drawer
   def initialize
      super

      # These should be overwritten by children
      gs = GlobalSettings.instance
      @colors = [
         [gs.fgColor, gs.bgColor],
         [gs.fgColor, gs.bgColor],
         [gs.fgColor, gs.bgColor]
      ]
   end

   def expand
      super

      gs = GlobalSettings.instance

      @colors.each_index {|i|
         bcolor = @colors[i][1]
         fcolor = @colors[i][0]
         style = <<-COLOR
         #{@menuStyle}

         QPushButton {
            background-color: #{bcolor};
            color: #{fcolor};
         }
         COLOR
         w = Qt::PushButton.new("A") do
            connect(SIGNAL :clicked) {
               gs.bgColor = bcolor
               gs.fgColor = fcolor
               gs.refresh
            }
         end
         w.setStyleSheet(style);
         self.layout.addWidget w
      }
   end
end

class ForegroundButton < ColorButton
   def expand
      gs = GlobalSettings.instance
      @colors = [
         ['#FFFFFF', gs.bgColor],
         ['#AAAAAA', gs.bgColor],
         ['#000000', gs.bgColor]
      ]

      super

   end
end

class BackgroundButton < ColorButton
   def expand
      gs = GlobalSettings.instance
      @colors = [
         [gs.fgColor, '#FFFFFF'],
         [gs.fgColor, '#AAAAAA'],
         [gs.fgColor, '#000000']
      ]

      super

   end
end

class SaveButton < MenuItem
   def initialize
      super 

      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/save.png'
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

      icon  = Qt::Icon.new 'assets/icons/black/open.png'
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

      icon  = Qt::Icon.new 'assets/icons/black/close.png'
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

