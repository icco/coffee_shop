
# the UI for the actual typing interface.
class TextBox < Qt::Widget
   def initialize
      super

      @gv = Qt::GraphicsView.new
      scene = Qt::GraphicsScene.new
      @tb = Qt::GraphicsTextItem.new "asdsadsa"
      @tb.setTextInteractionFlags Qt::TextEditable
      @tb.setTextWidth 550
      @tb.setPos 0, -700
      @tb1 = Qt::GraphicsTextItem.new "gfsgfdgd"
      @tb1.setTextInteractionFlags Qt::TextEditable
      @tb1.setTextWidth 550
      @tb.setPos 0, -200
      scene.addItem @tb
      scene.addItem @tb1
      scene.setFocusItem @tb
      @gv.setScene scene

      layout = Qt::VBoxLayout.new()
      layout.addWidget(@gv)
      setLayout(layout)
   end

   def text= txt
      @tb.setPlainText txt
   end
end

