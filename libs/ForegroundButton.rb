
class ForegroundButton < ColorButton
   def expand
      gs = GlobalSettings.instance
      @colors = [
         ['#FFFFFF', gs.bgColor],
         ['#AAAAAA', gs.bgColor],
         ['#000000', gs.bgColor]
      ]

      super

   end
end

