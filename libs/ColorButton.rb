
class ColorButton < Drawer
   def initialize
      super

      # These should be overwritten by children
      gs = GlobalSettings.instance
      @colors = [
         [gs.fgColor, gs.bgColor],
         [gs.fgColor, gs.bgColor],
         [gs.fgColor, gs.bgColor]
      ]
   end

   def expand
      super

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
         w.setStyleSheet(style);
         self.layout.addWidget w
      }
   end
end

