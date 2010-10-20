
# A class to represent something on disk.
class CoffeeFile
   # I can never seem to remember this little function name
   attr_accessor :fname, :lastsave, :changed
   attr_reader :text

   def initialize filename
      @text = ""
      @fname = filename
      @changed = true
   end

   def load filename
      if filename.nil?
         @fname = ""
      else
         @fname = filename
      end

      if @fname.empty?
         GlobalSettings.log "Empty filename, could not load"
      else
         file = File.new(@fname, 'r')
         @text = file.read
         @changed = true
         file.close
         GlobalSettings.log "Loaded #{@fname}"
         GlobalSettings.instance.text.text = @text
      end

      return @text
   end

   def text= txt
      @changed = true
      @text = txt
   end

   def save mode
      # Surprise surprise, we only want to save when we have a filename.
      if @fname.empty?
         case mode
         when 'auto'
            return
         when 'click'
            fname = Qt::FileDialog.getSaveFileName()
            @fname = fname.nil? ? "" : fname
            return if @fname.empty?
         else
            GlobalSettings.log "Unknow save mode: #{mode}."
         end
      end

      @text = GlobalSettings.instance.text.text
      file = File.new(@fname, 'w')
      file.write @text
      @changed = false
      # If we don't close, the file won't actually save until prgm death
      file.close
      @lastsave = Time.new
      GlobalSettings.log "Saved to #{@fname}"
   end
end

