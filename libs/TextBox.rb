
# This file deals with all of the text editing fun. If I were to try dealing
# with pagination again, I would do it in here.
class TextBox < Qt::Widget
   attr_accessor :tb

   def initialize
      super

      gs = GlobalSettings.instance

      # Key combos
      save = Qt::KeySequence.new("Ctrl+S")
      save_shortcut = Qt::Shortcut.new(save, self);
      save_shortcut.connect(SIGNAL :activated) { gs.file.save 'key' }

      open = Qt::KeySequence.new("Ctrl+O")
      open_shortcut = Qt::Shortcut.new(save, self);
      open_shortcut.connect(SIGNAL :activated) { gs.file.load Qt::FileDialog.getOpenFileName() }
            
      quit = Qt::KeySequence.new("Alt+F4")
      quit_shortcut = Qt::Shortcut.new(save, self);
      quit_shortcut.connect(SIGNAL :activated) { GlobalSettings.quit }

      # QTextEdit makes life so easy, it's almost depressing.
      @tb = Qt::TextEdit.new 
      @tb.connect(SIGNAL :textChanged) {
         gs.file.changed = true
         gs.file.text = self.text
         gs.file.save 'auto'
      }

      @tb.setFrameShape Qt::Frame::NoFrame
      @tb.setVerticalScrollBarPolicy Qt::ScrollBarAlwaysOn

      # We can't have this if we don't want a horizantal scroll
      #@tb.setWordWrapMode Qt::TextOption::WordWrap

      width = 700 # We want fixed width
      @tb.setMinimumSize(width, 0)
      @tb.setMaximumSize(width, 16777215)

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

   def title= x
      return @tb.setDocumentTitle x
   end

   def title
      return @tb.documentTitle
   end

   def document
      return @tb.document
   end

   def document= x
      return @tb.document = x
   end

   # Returns details about the currently edited file
   def stats
      # Word Count, scan could be bad on a large file...
      wc = self.text.scan(/(\w|-)+/).size

      mod = GlobalSettings.instance.file.changed
      ret = {
         'Word Count' => wc,
      }

      def ret.to_a
         r = super

         r = r.map {|pair|
            k, v = pair
            "#{k}: #{v}"
         }

         return r
      end

      return ret
   end
end
