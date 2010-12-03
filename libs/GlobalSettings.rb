require 'yaml'

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
      self.save
   end

   def save
      # Closes when block exits
      File.open(File.expand_path('~/.coffee_shop.yml'), 'w+') {|f| 
         f.write(self.config)
      }
   end

   def load
      c = {}
      File.open(File.expand_path('~/.coffee_shop.yml'), 'a+') { |yf| c = YAML::load( yf ) }

      @bgColor = c['bgColor'] ? c['bgColor'] : '#FFF' if c
      @fgColor = c['fgColor'] ? c['fgColor'] : '#000' if c
   end

   def appStyles
      @bgColor = '#FFF' if @bgColor.nil?
      @fgColor = '#000' if @fgColor.nil?

      return <<-GLOBAL
         QTextEdit {
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

   def config
      yaml = {
         'fgColor' => @fgColor,
         'bgColor' => @bgColor,
      }

      YAML::dump yaml
   end

   # A standard "log" format.
   def GlobalSettings.log text
      tFormat = "[%m/%d/%Y %H:%M:%S]: "
      t = Time.new
      puts t.strftime(tFormat) + text 
   end

   # Called to exit program
   def GlobalSettings.quit
      Qt::Application.instance.quit
   end
end

