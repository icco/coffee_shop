
class ColorButton < Drawer
   slots :updateColors 

   def initialize
      super
   end

   def updateColors
      # These should be overwritten by children
      gs = GlobalSettings.instance
      @colors = [
         [gs.fgColor, gs.bgColor],
         [gs.fgColor, gs.bgColor],
         [gs.fgColor, gs.bgColor]
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

         connect w, SIGNAL(:clicked), self, SLOT(:updateColors)

         w.setStyleSheet(style);
         self.layout.addWidget w
      }
   end
end

