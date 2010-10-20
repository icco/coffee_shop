
class StatsWidget < Qt::Widget

   def initialize
      super

      labels = []
      (0..4).each {|n|
         l = Qt::Label.new
         l.setText("Label #{n}")
         labels << l
      }

      layout = Qt::VBoxLayout.new
      labels.each {|l| layout.addWidget l }
      setLayout(layout)
   end
end

