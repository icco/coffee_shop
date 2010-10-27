class Menu < Qt::Widget
   def initialize
      super

      setMouseTracking true

      menu = []

      # Define the file menu layout
      menu[1] = Qt::HBoxLayout.new()
      menu[1].addWidget SaveButton.new
      menu[1].addWidget LoadButton.new
      menu[1].addWidget QuitButton.new
      menu[1].setAlignment Qt::AlignLeft

      # Define the fg color menu
      menu[2] = Qt::HBoxLayout.new()
      menu[2].addWidget ForegroundButton.new
      menu[2].setAlignment Qt::AlignLeft

      # Define the bg color menu
      menu[3] = Qt::HBoxLayout.new()
      menu[3].addWidget BackgroundButton.new
      menu[3].setAlignment Qt::AlignLeft

      menu[4]  = Qt::HBoxLayout.new()
      menu[4].addWidget StatsWidget.new
      menu[4].setAlignment Qt::AlignLeft

      # Layout the right side menus
      menus = Qt::VBoxLayout.new
      menu.each {|m|
         menus.addLayout m if !m.nil?
      }

      menus.setAlignment Qt::AlignTop

      setLayout menus
   end

   def mouseMoveEvent ev
      super 

      #self.setHidden true
   end
end
