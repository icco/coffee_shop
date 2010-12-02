
class ColorButton < Drawer
   slots :updateColors 

   def initialize
      super
   end

   def updateColors
      # These should be overwritten by children
      gs = GlobalSettings.instance
      @colors = [
         #    FG         BG
         ['#000000', '#FFFFFF'],
         ['#00FE00', '#000000'],
         ['#FFFFFF', '#000000'],
         ['#111111', '#333333'],
         ['#BBBBBB', '#000000']
      ]
   end

   def collapse
      self.updateColors

      super
   end

   def expand
      super

      self.updateColors

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

         # This in theory updates colors on button click...
         connect w, SIGNAL(:clicked), self, SLOT(:updateColors)

         w.setStyleSheet(style);
         self.layout.addWidget w
      }
   end
end

