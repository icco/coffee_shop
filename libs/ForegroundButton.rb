
class ForegroundButton < ColorButton
   def updateColors
      gs = GlobalSettings.instance
      @colors = [
         ['#FFFFFF', gs.bgColor],
         ['#AAAAAA', gs.bgColor],
         ['#000000', gs.bgColor]
      ]
   end
end

