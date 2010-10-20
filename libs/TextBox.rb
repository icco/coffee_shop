
# This file deals with all of the text editing fun. If I were to try dealing
# with pagination again, I would do it in here.
class TextBox < Qt::Widget
   def initialize
      super

      gs = GlobalSettings.instance

      # QTextEdit makes life so easy, it's almost depressing.
      @tb = Qt::TextEdit.new 
      @tb.connect(SIGNAL :textChanged) {
         gs.file.text = self.text
         gs.file.save 'auto'
      }
            @tb.setFrameShape Qt::Frame::NoFrame

      layout = Qt::VBoxLayout.new()
      layout.addWidget(@tb)
      setLayout(layout)
   end

   # Need to implement this for opening
   def text= txt
      @tb.setPlainText txt
      self.update
   end

   # Need to implement this for saving, and other things... I think.
   def text
      return @tb.toPlainText
   end

   # Returns details about the currently edited file
   def stats
      # Word Count, scan could be bad on a large file...
      wc = self.text.scan(/(\w|-)+/).size

      mod = GlobalSettings.instance.file.changed

      return {
         :word_count => wc,
         :modified => mod
      }
   end
end

