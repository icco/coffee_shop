
# Super class for anything in the menu
class MenuItem < Qt::Widget
   def initialize
      super

      # Now that we know about stylesheets, we can save a string that all
      # MenuItems can use to style themselves. It's kind of amazing really.
      @menuStyle = <<-STYLE
      QPushButton {
         border: none;
         width:  20px;
         height: 20px;
      }
      STYLE
   end
end

