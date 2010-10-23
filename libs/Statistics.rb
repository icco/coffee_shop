
class StatsWidget < Qt::Widget
   def initialize
      super
      gs = GlobalSettings.instance

      @labels = []
      gs.text.stats.to_a.each {|s|
         l = Qt::Label.new do
            connect gs.text.tb, SIGNAL(:textChanged), self, SLOT(:update)
         end
         l.setText(s)
         @labels << l
      }

      @layout = Qt::VBoxLayout.new
      @labels.each {|l| @layout.addWidget l }
      setLayout(@layout)

      # Calls timerEvent every one second
      startTimer(1000);
   end

   def timerEvent ev
      self.update
   end

   def update
      (0...@layout.count).each {|n| 
         val = GlobalSettings.instance.text.stats.to_a[n]
         @layout.itemAt(n).widget.setText(val)
      }
      
      super
   end
end

