#!/usr/bin/env ruby

#Shoes.app {
#   button("Turl?") {
#      alert("DUDE!")
#   }
#}

#Shoes.app do
#   para "testing", " no seriously... I'm testing...."
#   para "Oh, to fling and be flung.", :size => 48
#end

#Shoes.app do
#  @o = oval :top => 0, :left => 0,
#             :radius => 40
#  stack :margin => 40 do
#    title "Dancing With a Circle"
#    subtitle "How graceful and round."
#  end
#  motion do |x, y|
#    @o.move width - x, height - y
#  end
#end

#Shoes.app do
#  @e = edit_line :width => 400
#  button “O.K.” do
#    alert @e.text
#  end
#end

#Shoes.app do
#  @e = edit_box "Would that I...",
#    :width => 400, :height => 240
#end

class BookList < Shoes
  url '/',      :index
  url '/twain', :twain
  url '/kv',    :vonnegut
  def index
    para "Books I’ve read: ",
      link("by Mark Twain", :click => "/twain"),
      link(" by Kurt Vonnegut", :click => "/kv")
  end
  def twain
    para "Just Huck Finn.\n",
      link("Go back.", :click => "/")
  end
  def vonnegut
    para "Cat’s Cradle. Sirens of Titan. ",
      "Breakfast of Champions.\n",
      link("Go back.", :click => "/")
  end
end

Shoes.app :width => 400, :height => 500

