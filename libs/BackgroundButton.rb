class BackgroundButton < ColorButton
   def updateColors
      gs = GlobalSettings.instance
      @colors = [
         [gs.fgColor, '#FFFFFF'],
         [gs.fgColor, '#AAAAAA'],
         [gs.fgColor, '#000000']
      ]
   end
end

