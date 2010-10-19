class ColorButton < MenuItem
   def initialize
      super
   end
end

# This is a button that expands when clicked
class Drawer < MenuItem
   slots 'onclick()'

   def initialize
      super
      @open = false
      self.expand
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
      label = "Open"

      @but = Qt::PushButton.new(icon, "")

      connect @but, SIGNAL('clicked()'), self, SLOT('onclick()')

      @but.setStyleSheet(@menuStyle);
      layout = Qt::VBoxLayout.new()
      layout.addWidget(@but)
      setLayout(layout)
   end

   def expand
      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/arrow1_w.png'
      label = "Close"

      @but = Qt::PushButton.new(icon, "")

      connect @but, SIGNAL('clicked()'), self, SLOT('onclick()')

      @but.setStyleSheet(@menuStyle);
      layout = Qt::VBoxLayout.new()
      layout.addWidget(@but)
      setLayout(layout)
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

