# Deals with loading a file into the text editor on button click.
class LoadButton < MenuItem
   def initialize
      super 
      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/open.png'
      label = "Load"

      but = Qt::PushButton.new(icon, "") do
         connect(SIGNAL :clicked) {
            if (gs.file.changed)
               gs.file.save 'auto'
            end

            gs.file.load Qt::FileDialog.getOpenFileName
         }
      end

      but.setStyleSheet(@menuStyle);

      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
end
