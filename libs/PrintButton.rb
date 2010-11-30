# Prints the current tab on click
class PrintButton < MenuItem
   def initialize
      super 
      gs = GlobalSettings.instance

      icon  = Qt::Icon.new 'assets/icons/black/scream.png'
      label = "Print"

      but = Qt::PushButton.new(icon, "") do
         connect(SIGNAL :clicked) {
            if (gs.file.changed)
               #gs.file.save 'print'
            end

            # something like this...
            dlg = Qt::PrintDialog.new
            if dlg.exec == Qt::Dialog::Accepted
               gs.text.document.print dlg.printer
            else
               GlobalSettings.log "Printing fail."
            end
         }
      end

      but.setStyleSheet(@menuStyle);

      layout = Qt::VBoxLayout.new
      layout.addWidget(but)
      setLayout(layout)
   end
end
