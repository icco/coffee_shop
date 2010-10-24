class BackgroundButton < ColorButton
   def expand
      gs = GlobalSettings.instance
      @colors = [
         [gs.fgColor, '#FFFFFF'],
         [gs.fgColor, '#AAAAAA'],
         [gs.fgColor, '#000000']
      ]

      super

   end
end

