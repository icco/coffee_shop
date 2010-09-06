
# A class to represent something on disk.
class CoffeeFile
   # I can never seem to remember this little function name
   attr_accessor :fname, :lastsave, :changed
   attr_reader :text, :pageCount

   # Number of characters per page
   @@perPage = 1000

   def initialize filename
      @text = ""
      @fname = filename
      @pageCount = 1
   end

   def load filename
      if filename.nil?
         @fname = ""
      else
         @fname = filename
      end

      if @fname.empty?
         log "Empty filename, could not load"
      else
         file = File.new(@fname, 'r')
         @text = file.read
         @changed = true
         file.close
         GlobalSettings.instance.text.text = @text
      end

      return @text
   end

   def save mode
      if !@lastsave.nil? and (Time.new - @lastsave > 1)
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
               log "Unknow save mode: #{mode}."
            end
         end

         file = File.new(@fname, 'w')
         file.write @text
         @changed = false
         # If we don't close, the file won't actually save until prgm death
         file.close
         @lastsave = Time.new
      else
         @lastsave = Time.at(0)
      end
   end

   # When text comes in, we need to recalc pages.
   def text= txt
      @text = txt
      @pageCount = (@text.length.to_f / @@perPage.to_f)
   end

   # This function returns the text of the page requested.
   def page num
      if num < 0 || num > @pageCount
         return nil
      end

      # Instead of doing the math, and doing the offset lookup, we could store
      # the page content in a hash table on change of @text.
      offset = num * @@perPage
      range = offset...(offset+@@perPage)
      out = @text.slice(range)

      return out.nil? ? @text : out
   end
end

