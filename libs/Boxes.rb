
class Boxes < Qt::Widget
   def initialize
      super
      @widgets = []
      @curIndex = 0
      @pc = GlobalSettings.instance.file.pageCount;

      layout = Qt::VBoxLayout.new()
      layout.setSizeConstraint Qt::Layout::SetMinimumSize

      (0...@pc).each {|n|
         @widgets[n] = build n
         layout.addWidget(@widgets[n])
      }

      setLayout(layout)
   end


   # called every time the text changes.
   def paintEvent x
      # Need to move text around
      txt = self.text
      GlobalSettings.instance.file.text = txt
      gspc = GlobalSettings.instance.file.pageCount

      # This makes sure the widgets are laid out.
      (0...@pc).each {|n|
         @widgets[n] = build n if @widgets[n].nil?
         self.layout.addWidget(@widgets[n]) if self.layout.indexOf(@widgets[n]) < 0
      }

      # This distributes the text among the pages. It sadly does not work. 
      #(0...@pc).each {|n|
      #   @widgets[n].setPlainText GlobalSettings.instance.file.page n
      #}
   end

   def text= txt
      GlobalSettings.instance.file.text = txt
      (0...GlobalSettings.instance.file.pageCount).each {|n|
         @widgets[n] = build n if @widgets[n].nil?
         @widgets[n].setPlainText GlobalSettings.instance.file.page n
      }
   end

   def text
      t = ""
      @widgets.each {|v| t += v.plainText }

      return t
   end

   def get n
      return @wigets[n]
   end

   def build n
      wid = Qt::PlainTextEdit.new 

      wid.setFixedWidth 570
      wid.setFixedHeight 750

      # Queues up a paint event when text changes.
      wid.connect(SIGNAL :textChanged) { update }

      wid.setVerticalScrollBarPolicy Qt::ScrollBarAlwaysOff
      wid.setHorizontalScrollBarPolicy Qt::ScrollBarAlwaysOff

      wid.setFrameShape Qt::Frame::NoFrame

      return wid
   end
end 

