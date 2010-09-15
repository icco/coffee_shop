
# the UI for the actual typing interface.
class TextBox < Qt::Widget
   def initialize
      super

      @gv = Qt::GraphicsView.new
      scene = Qt::GraphicsScene.new
      @tb = CoffeePage.new "page 1"
      @tb.setTextInteractionFlags Qt::TextEditable
      @tb.setTextWidth 550
      @tb.setPos 0, 0

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
   def boundingRect
      t = super
      t2 = Qt::RectF.new
      t2.setHeight 700
      t2.setWidth t.width
      return t2
   end

   def shape
      t = self.boundingRect
      path = Qt::PainterPath.new
      path.addRect(t);
      return path;
   end
end

