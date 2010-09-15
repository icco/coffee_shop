
# the UI for the actual typing interface.
class TextBox < Qt::Widget
   def initialize
      super

      @gv = Qt::GraphicsView.new
      scene = Qt::GraphicsScene.new
      @tb = CoffeePage.new "page 1"
      @tb.setPos 0, 0

      @tb1 = CoffeePage.new "page 2"
      @tb1.setPos 0, 0

      scene.addItem @tb
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

class CoffeePage < Qt::GraphicsTextItem
   def initialize a
      super a

      setTextInteractionFlags Qt::TextEditable
      setTextWidth 550
   end
   
   def boundingRect
      t = super
      t2 = Qt::RectF.new
      t2.setHeight 700
      t2.setWidth t.width
      return t2
   end

   def shape
      path = Qt::PainterPath.new
      path.addRect(self.boundingRect);
      return path;
   end
end

