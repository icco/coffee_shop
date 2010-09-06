
class TextBox < Qt::Widget
   def initialize
      super

      gs = GlobalSettings.instance
      @boxes = Boxes.new

      @sa = Qt::ScrollArea.new
      @sa.setFrameShape Qt::Frame::NoFrame

      @sa.setWidget @boxes
      layout = Qt::VBoxLayout.new()
      layout.addWidget(@sa)
      setLayout(layout)
   end

   def text= txt
      @boxes.text = txt
   end
end

