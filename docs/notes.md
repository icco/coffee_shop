# Research Notes

This is where I store the work I do by day, and my ideas. As a warning there is
some profanity throughout and my thoughts are jumbled to say the least. It is
also not a guarantee that it lists all of the work I have done, just a close
approximation of what I was thinking about the days I remembered to put down my
thoughts.

## 4.25.10

### WriteRoom

 * Lets you change font and colors
 * obscure key combinations to do any sort of display settings
 * ESC lets you turn app into normal text editor. Almost seems like a wrapper around text edit.
 * Growl notifications still appear
 * Wrap to page is pretty cool
 * [normal type](http://github.com/icco/coffee_shop/raw/master/images/writeroom1.png)
 * [page broken](http://github.com/icco/coffee_shop/raw/master/images/writeroom2.png)

### OmmWriter

 * Lets you change font (sans, serif, script), font-size, themes (background/color combinations), background music and typing noise
 * I found typing noise very soothing, but I preferred to pick my own background music.
 * very limited choice in themes. No Black/Green, low contrast option
 * the sound the program produced an emotion that seemed to promote typing, although I'm not sure if I could say it was distraction free.
 * UI was much more visible
 * gave scroll bar and word count
 * adjustable work area
 * [blank page](http://github.com/icco/coffee_shop/raw/master/images/ommwriter1.png)
 * [normal type](http://github.com/icco/coffee_shop/raw/master/images/ommwriter2.png)
 * [menu on mouse move](http://github.com/icco/coffee_shop/raw/master/images/ommwriter3.png)

### Other References

 * <http://en.wikipedia.org/wiki/Word_processor>
 * <http://daringfireball.net/projects/markdown/>

## 5.12.10

### OpenOffice Writer 3.2

 * A substantial amount of features. 
 * Very easy to just start typing, although you feel like you need to format your writing.
 * Has a full screen mode, crashes some times when coming in and out.
 * export to pdf, very useful
 * Spell check. Seemed much more obvious than the other apps
 * Had to select all of text to change font, colors, etc.
 * Supported so many fonts it blew my mind.
 * very easy to zoom with slider in bottom right.
 * Lots of buttons that I had no idea what they did, kind of scared me.
 * [screenshot 1](http://github.com/icco/coffee_shop/raw/master/images/oo1.png)
 * [screenshot 2](http://github.com/icco/coffee_shop/raw/master/images/oo2.png)
 * [screenshot 3](http://github.com/icco/coffee_shop/raw/master/images/oo3.png)

### Vim 7.2

 * Incredibly customizable
 * all commands are incredibly arcane
 * full-screen ability is dependent on terminal app.
 * [screenshot 1](http://github.com/icco/coffee_shop/raw/master/images/vim1.png)
 * [screenshot 2](http://github.com/icco/coffee_shop/raw/master/images/vim2.png)
 * [screenshot 3](http://github.com/icco/coffee_shop/raw/master/images/vim3.png)

### Mircosoft Word 5.5

 * Only runs in dosbox.
 * a pain to install. Extracted 400 files before setup and then another 200 after install
 * navigating document was done with keyboard, but you could select sections with the mouse
 * screenshots were a pain
 * no color or font customizations
 * fullscreen text
 * page breaks were very obvious with a dotted line
 * [screenshot 1](http://github.com/icco/coffee_shop/raw/master/images/w55_1.png)
 * [reference article](http://www.downloadsquad.com/2005/11/25/free-file/)
 * [Download link](http://download.microsoft.com/download/word97win/Wd55_be/97/WIN98/EN-US/Wd55_ben.exe)

## 6.1.10

I went through the [survey](/survey) and put together my results. I had left
the survey relatively open ended, but that gave me decent results. Basically I
discovered that there were two classifications of users of word processors:
those that wrote for a corporate / academic environment and those that wrote
for themselves. The users that wrote more for academia and corporate positions
tended to want lots of formatting options. Users writing for themselves
wanted something that hid everything and let them just write. 

None of the people I surveyed wanted any sort of auto-correct and everyone
wanted spell check.

Based on these discoveries I found my user group, who I have decided to call
Johnny. Johnny writes fiction in his free time and aspires to be a writer. He
is currently employed doing other things, so he uses his word processor as he
commutes and during his time off. Most of what Johnny writes tends to be one or
two pages, but he has been known to turn out novels depending on his mood.

## 6.13.10

Played around with the Ruby UI toolkit [Shoes](http://github.com/shoes/shoes)
and read through the whole [shoes book](http://github.com/downloads/shoes/shoes/nks.pdf). 

Shoes seems like a great idea, but in the end I don't think it is what I will
be going with because it seems too close to the web and feels like it is more
meant to prototype than to build applications for long term use and
development.

## 7.3.10

For the last few days (weeks?) I have been messing around with some other gui
toolkits. I had wanted to use GTK+, but the ruby extensions seem to be buggy,
old, and not under current maintenance. It seems like Qt is the way to go, so
I started playing around with it. I found a [great tutorial](http://www.darshancomputing.com/qt4-qtruby-tutorial/) 
and the Qt4 documentation is really good, heck I even figured out the full
screen stuff. Now on to getting a working prototype...

## 7.12.10

Proved that you can build something close to the UI that I had spec'd out.
Current prototype allows for typing and quiting. Still need to figure out how
to do things like open files and the like. One downside, beyond that ruby
tutorial there does not seem to be any documentation of ruby-qt. Qt has great
documentation, I just need to guess on some class names and such.

## 8.14.10

found the application `rbqtapi`. Makes learning about accessor functions a lot
easier. 

Sad that it took me so long to get back to work on this, but I can now access
the text from the box. 

Thoughts on my file representation. 
 
 * I need to have multiple files open at the same time, and multiple buffers with text in them.
 * when do buffers transform into files?
 * is filename and text enough for a file? I think it is...
 * should I save on text change or on a timer? Both are easy...
   * <http://doc.trolltech.com/3.3/qtextedit.html>
   * <http://doc.trolltech.com/4.2/qtimer.html>
 * Shawn brought up the point that find/replace could be a bit of a bitch, but there was an algorithm we talked about in 349 that would be helpful.

Can't seem to get Qt4 on ruby 1.9 on Ubuntu. WTF.

## 8.15.10

Thinking about how to deal with paging. The best bet is probable to create a ui
element is a scrollbox containing a number of textboxes. As the text grows
longer we add more text boxes (so basically each page equals one text box). 

I need to figure out how to create a scrollbox that contains x number of fixed
sized text boxes. Generating them, and creating them on load should be easy.

 * <http://doc.trolltech.com/4.4/qwidget.html#geometry-prop>

I also need to decide how I want to build and store the config options. I'm
thinking just a classic hidden file. I doubt I'll need more than a single yaml
file's worth of information. I assume yaml should be a sufficient enough file
format for config.

I also played around with the qt-designer program. Definitely not easy to use on
a small screen, but the command `rbuic4 coffee.ui -x -o mainform.rb` is a cool
idea to say the least. It takes a .ui file (what the qt designer outputs) and
then generates ruby code that runs and creates the widget you designed. It
looks like shit, and the code is spaghetti puke to say the least, but at least
it works.

Also, I should write a little javascript that builds a table of contents out of
the h2s and h3s on the page...

## 8.25.10

So, things I learned today... 

 1. The [singleton](http://dalibornasevic.com/posts/9-ruby-singleton-pattern-again) pattern is great, and ruby methods are teh beez knees. 
 2. Talking over problems with other coders makes remembering things a whole lot easier
 3. I CAN NOW SAVE TO A FILE OF MY CHOICE. BYAHHHHH.

## 8.28.10

I can now load and save files. Which is awesome. I still need to figure out how
to do pagination and make the menu nice. After that, tabs would be great.

I also need to look at [QGraphicsScene][gv] which lets me do custom graphics in
the menu.

[gv]: http://doc.qt.nokia.com/4.6/graphicsview.html

