
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
