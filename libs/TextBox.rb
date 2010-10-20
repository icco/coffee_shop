
# This file deals with all of the text editing fun. If I were to try dealing
# with pagination again, I would do it in here.
class TextBox < Qt::Widget
   def initialize
      super

      # QTextEdit makes life so easy, it's almost depressing.
      @gv = Qt::TextEdit.new

      layout = Qt::VBoxLayout.new()
      layout.addWidget(@gv)
      setLayout(layout)
   end

   # Need to implement this for opening
   def text= txt
      @gv.setPlainText txt
      self.update
   end

   # Need to implement this for saving, and other things... I think.
   def text
      return @gv.toPlainText
   end

   # Returns details about the currently edited file
   def stats
      # Word Count, scan could be bad on a large file...
      wc = self.text.scan(/(\w|-)+/).size

      mod = true # Due a diff of the file and buffer?

      return {
         :wc => wc,
         :modified => mod
      }
   end
end

