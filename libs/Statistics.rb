
class StatsWidget < Qt::Widget
   def initialize
      super

      @labels = []
      GlobalSettings.instance.text.stats.each_pair {|key, value|
         l = Qt::Label.new
         l.setText("#{key}: #{value.inspect}")
         @labels << l
      }

      layout = Qt::VBoxLayout.new
      @labels.each {|l| layout.addWidget l }
      setLayout(layout)
   end

   def update
      GlobalSettings.instance.text.stats.each_pair {|key, value|
         l = Qt::Label.new
         l.setText("#{key}: #{value}")
         @labels << l
      }
      
      super
   end
end

