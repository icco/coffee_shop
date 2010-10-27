
# Next we define this class, which is a singleton for storing configuration
# data that needs to be passed around the program. 
class GlobalSettings
   include Singleton
   attr_accessor :text, :files, :currentFile, :bgColor, :fgColor

   def file
      return @files[@currentFile]
   end

   def file=(a)
      @files[@currentFile] = a
   end

   def app
      return Qt::Application.instance
   end

   def update
      self.refresh
   end

   def refresh
      app.setStyleSheet(appStyles)
   end

   def appStyles
      @bgColor = '#FFF' if @bgColor.nil?
      @fgColor = '#000' if @fgColor.nil?

      return <<-GLOBAL
         * {
            background-color: #{@bgColor};
         }

         QPlainTextEdit {
            color: #{@fgColor};
            background-color: #{@bgColor};
            border: 1px solid #{@fgColor}; 
            padding: 10px;
         }

         QScrollArea {
            background-color: #{@bgcolor};
            color: #{@fgcolor};
         }

         QScrollBar {
            border: 1px solid #{@fgColor}; 
            background-color: #{@bgcolor};
            color: #{@fgcolor};
         }
      GLOBAL
   end

   # A standard "log" format.
   def GlobalSettings.log text
      tFormat = "[%m/%d/%Y %H:%M:%S]: "
      t = Time.new
      puts t.strftime(tFormat) + text 
   end
end

