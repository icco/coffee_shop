
class TextBox < Qt::Widget
   def initialize
      super

      @tb = Qt::PlainTextEdit.new
      @doc = @tb.document

      size = Qt::SizeF.new
      size.setWidth 570
      size.setHeight 750
      @doc.setPageSize size

      #textLayout = Qt::PlainTextDocumentLayout.new @doc
      #@doc.setDocumentLayout textLayout

      @tb.connect(SIGNAL :textChanged) { 
         update
         GlobalSettings.log @doc.pageCount.to_s
      }

      @tb.setFrameShape Qt::Frame::NoFrame

      layout = Qt::VBoxLayout.new()
      layout.addWidget(@tb)
      setLayout(layout)
   end

   def text= txt
      @tb.setPlainText txt
   end
end

