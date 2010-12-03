
class FontButton < Drawer
   def initialize
      super
   end

   def collapse
      super
   end

   def expand
      super

      gs = GlobalSettings.instance
      b = []

      (0...3).each {|i|
         b[i] = Qt::PushButton.new("F") do
            connect(SIGNAL :clicked) {
               gs.font = 'Helvetica'
               gs.refresh
            }
         end

         b[i].setStyleSheet(@menuStyle);
         self.layout.addWidget b[i]
      }
   end
end
