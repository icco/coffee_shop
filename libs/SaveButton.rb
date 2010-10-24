
class SaveButton < MenuItem
   def initialize
      super 

      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/save.png'
      label = "Save"

      but = Qt::PushButton.new(icon, "") do
         connect(SIGNAL :clicked) { gs.file.save 'click' }
      end
      but.setStyleSheet(@menuStyle);
      layout = Qt::VBoxLayout.new()
      layout.addWidget(but)
      setLayout(layout)
   end
end

