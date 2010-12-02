
class FontButton < Drawer
   def initialize
      super
   end

   def collapse
      super
   end

   def expand
      super

      w = Qt::PushButton.new("A") do
         connect(SIGNAL :clicked) {
            gs.bgColor = bcolor
            gs.fgColor = fcolor
            gs.refresh
         }
      end
      w.setStyleSheet("");
      self.layout.addWidget w
   end
end
