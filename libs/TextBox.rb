
# the UI for the actual typing interface.
class TextBox < Qt::Widget
   def initialize
      super

      @pages = []

      @gv = Qt::GraphicsView.new
      @scene = Qt::GraphicsScene.new
      @pages[0] = CoffeePage.new "page 1"
      @pages[0].setOffset 0

      @pages.each {|tb|
         tb.setParent self
         @scene.addItem tb
      }


      @scene.setFocusItem @pages[0]
      @gv.setScene @scene

      layout = Qt::VBoxLayout.new()
      layout.addWidget(@gv)
      setLayout(layout)
   end

   def text= txt
      self.update
   end

   def text
      ret = ""
      @pages.each {|tb| ret += tb.toPlainText }
      return ret
   end

   def update
      file = GlobalSettings.instance.file
      file.text = self.text
      (0...file.pageCount).each { |pagenum|
         if @pages[pagenum].nil?
            @pages[pagenum] = CoffeePage.new ""
            @pages[pagenum].setOffset pagenum
            @scene.addItem @pages[pagenum]
         end

         @pages[pagenum].setPlainText file.page(pagenum)
      }
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

   # given the page number, set the proper position in the scene.
   def setOffset x
      setPos 0, (x*800)
   end

   def keyReleaseEvent x
      self.parent.update
   end
end

