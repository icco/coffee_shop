
class BgColorButton < MenuItem
   def initialize
      super

      gs = GlobalSettings.instance

      # I need to dynamically figure out icon color based on bg color.
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
