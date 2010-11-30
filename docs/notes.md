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
 * [normal type](http://github.com/icco/coffee_shop/raw/master/docs/images/writeroom1.png)
 * [page broken](http://github.com/icco/coffee_shop/raw/master/docs/images/writeroom2.png)

### OmmWriter

 * Lets you change font (sans, serif, script), font-size, themes (background/color combinations), background music and typing noise
 * I found typing noise very soothing, but I preferred to pick my own background music.
 * very limited choice in themes. No Black/Green, low contrast option
 * the sound the program produced an emotion that seemed to promote typing, although I'm not sure if I could say it was distraction free.
 * UI was much more visible
 * gave scroll bar and word count
 * adjustable work area
 * [blank page](http://github.com/icco/coffee_shop/raw/master/docs/images/ommwriter1.png)
 * [normal type](http://github.com/icco/coffee_shop/raw/master/docs/images/ommwriter2.png)
 * [menu on mouse move](http://github.com/icco/coffee_shop/raw/master/docs/images/ommwriter3.png)

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
 * [screenshot 1](http://github.com/icco/coffee_shop/raw/master/docs/images/oo1.png)
 * [screenshot 2](http://github.com/icco/coffee_shop/raw/master/docs/images/oo2.png)
 * [screenshot 3](http://github.com/icco/coffee_shop/raw/master/docs/images/oo3.png)

### Vim 7.2

 * Incredibly customizable
 * all commands are incredibly arcane
 * full-screen ability is dependent on terminal app.
 * [screenshot 1](http://github.com/icco/coffee_shop/raw/master/docs/images/vim1.png)
 * [screenshot 2](http://github.com/icco/coffee_shop/raw/master/docs/images/vim2.png)
 * [screenshot 3](http://github.com/icco/coffee_shop/raw/master/docs/images/vim3.png)

### Mircosoft Word 5.5

 * Only runs in dosbox.
 * a pain to install. Extracted 400 files before setup and then another 200 after install
 * navigating document was done with keyboard, but you could select sections with the mouse
 * screenshots were a pain
 * no color or font customizations
 * fullscreen text
 * page breaks were very obvious with a dotted line
 * [screenshot 1](http://github.com/icco/coffee_shop/raw/master/docs/images/w55_1.png)
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

Played around with the Ruby UI toolkit [Shoes][shoes] and read through the
whole [shoes book][shoesbook]. 

Shoes seems like a great idea, but in the end I don't think it is what I will
be going with because it seems too close to the web and feels like it is more
meant to prototype than to build applications for long term use and
development.

[shoes]: http://github.com/shoes/shoes
[shoesbook]: http://github.com/downloads/shoes/shoes/nks.pdf

## 7.3.10

For the last few days (weeks?) I have been messing around with some other gui
toolkits. I had wanted to use GTK+, but the ruby extensions seem to be buggy,
old, and not under current maintenance. It seems like Qt is the way to go, so I
started playing around with it. I found a [great tutorial][tut] and the Qt4
documentation is really good, heck I even figured out the full screen stuff.
Now on to getting a working prototype...

[tut]: http://www.darshancomputing.com/qt4-qtruby-tutorial/

## 7.12.10

Proved that you can build something close to the UI that I had spec'd out.
Current prototype allows for typing and quiting. Still need to figure out how
to do things like open files and the like. One downside, beyond that ruby
tutorial there does not seem to be any documentation of ruby-qt. Qt has great
documentation, I just need to guess on some class names and such.

## 8.14.10

I found the application `rbqtapi`. Makes learning about accessor functions a lot
easier. 

Sad that it took me so long to get back to work on this, but I can now access
the text from the box. 

Thoughts on my file representation. 
 
 * I need to have multiple files open at the same time, and multiple buffers with text in them.
 * When do buffers transform into files?
 * Is filename and text enough for a file? I think it is...
 * Should I save on text change or on a timer? Both are easy...
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

Also, I should write a little JavaScript that builds a table of contents out of
the h2s and h3s on the page...

## 8.25.10

So, things I learned today... 

 1. The [singleton][sing] pattern is great, and ruby methods are teh beez knees. 
 2. Talking over problems with other coders makes remembering things a whole lot easier
 3. I CAN NOW SAVE TO A FILE OF MY CHOICE. BYAHHHHH.

[sing]: http://dalibornasevic.com/posts/9-ruby-singleton-pattern-again

## 8.28.10

I can now load and save files. Which is awesome. I still need to figure out how
to do pagination and make the menu nice. After that, tabs would be great.

I also need to look at [QGraphicsScene][gv] which lets me do custom graphics in
the menu.

[gv]: http://doc.qt.nokia.com/4.6/graphicsview.html

## 8.29.10

__NOTE__: I think this has been implied, but there are often multihour breaks in
between the thought processes of some paragraphs. This is especially true
today.

For a moment there, I thought about the fact that I could have written this as
a web app and used [AIR][air] to display this on the desktop. But then I
remembered that I'm doing this so I can experience the pain that is developing
for the desktop.

Anyway, the Qt documentation is absurd. Everything seems so over engineered, it
reminds me of why I hate Java and C++. I'm escaping some of that by coding in
ruby: 

    quit = Qt::PushButton.new('Quit') do
       connect(SIGNAL :clicked) { Qt::Application.instance.quit }
    end 

I've been trying to figure out how to replace the word "Quit" with an image. It
seems to solve this issue I need to use either a [QIcon][qi] or a [QLabel][ql].

To do the type of pop out menus that I have proposed in the [UI Specs][ui], I
believe I need to build a [QMenu][qm] and then use `QtPushButton::setMenu()` to
put stuff into said pop-out menu.

So I discovered that [Qt supports StyleSheets][qsss]. This is probably the
greatest discovery I could have made. This will make style the whole app really
easy. So happy that I found this.

[qsss]: http://doc.qt.nokia.com/4.4/stylesheet-syntax.html
[ql]: http://doc.trolltech.com/4.1/qlabel.html
[qi]: http://doc.trolltech.com/4.1/qicon.html
[qm]: http://doc.trolltech.com/4.1/qmenu.html 
[ui]: /ui

## 8.30.10

I started working on pagination today. Very little success.

## 9.3.10

The paintEvent function that widgets can implement is awesome. Basically
whenever the widget feels it needs to be redrawn, it calls the paintEvent
function. So you can then dynamically recreate the widget right there. It's
awesome.

## 9.6.10

While paintEvent was cool, I ran into all sorts of issues trying to redraw
widgets while they were in use. Paginating text loaded from a file is easy,
paginating on the fly was a bitch.

Tried out WxRuby and Ruby/Tk. As hard as it is to beleive, both are far worse
than Qt, mainly because Qt has "good" documentation and tutorials.

Walked through the source of [QTextEdit and QPrinter][qsrc]. This confirmed all
of my suspicions that Qt has no interest in write time pagination. This seems
like such a silly view issue that I should be able to code everything up and go
from there, but we shall see. I had everything looking the way I wanted, just
not working the way I wanted.

Also, at some point I need to turn my makefile into a [rakefile][rake].

Scanning through the source of KWord I found [QTextFormat][qtf] which sounds
promissing.

[qsrc]: http://qt.gitorious.org/qt/qt/blobs/4.7/src/gui/text/qtextdocument.cpp#line1629
[rake]: http://rake.rubyforge.org/files/doc/rakefile_rdoc.html
[qtf]: http://doc.trolltech.com/4.3/qtextformat.html

## 9.11.10

I lied, QTextFormat is not what I want. I've posted to the Qt mailing list to
see if maybe someone can figure out a solution, because I am stuck.

## 9.12.10

I asked around on the Qt forums, and got [a reasonable response][qfr].
Basically it sounds like I need to reinvent the QTextEdit. Classes I need/am
looking at:

 * <http://doc.trolltech.com/4.6/qgraphicsscene.html>
 * <http://doc.trolltech.com/4.6/graphicsview.html>
 * <http://doc.trolltech.com/4.6/qgraphicsitem.html>
 * <http://doc.trolltech.com/4.6/qgraphicstextitem.html>

[qfr]: http://developer.qt.nokia.com/forums/viewthread/862/

## 9.15.10

Made some good progress. Trying to figure out the logic behind deciding when to
draw new pages, and how.

## 9.18.10

I changed TextBox to have an update function that gets called whenever the text
changes, which is kind of awesome. Now I just need to write it so it does the right thing.

 * [this example][graph-ex] is good
 * [key event][qkey] is fired when you type

[graph-ex]: http://doc.qt.nokia.com/4.3/graphicsview-diagramscene.html
[qkey]: http://doc.trolltech.com/4.6/qkeyevent.html

## 10.2.10

[James Pearson][jp] showed me a new writing program for the iPad, called
[Writer][writer]. [Dave Patierno][dp] ended up buying it for his iPad and
letting me try it out. It has some interesting features. One of the ones it
totes as being amazing is it's ability to predict reading time. Not entirely
sure how it does that, but it's an interesting idea. It also has a reading mode
that highlights what you are supposedly reading. I find it interesting, because
I found it really hard to use as a writer, and it lacked touch controls for
writting navigation. Both of these seem kind of important to me as a user, and
it's not something I would use. But the internet media loves it, so maybe I
just don't get it.

 * [Screenshot 1][writer1]
 * [Screenshot 2][writer2]
 * [Screenshot 3][writer3]

[writer]: http://www.informationarchitects.jp/en/writer-for-ipad/
[dp]: http://dmpatierno.com/
[jp]: http://changedmy.name/
[writer1]: http://github.com/icco/coffee_shop/raw/master/docs/images/writer1.png
[writer2]: http://github.com/icco/coffee_shop/raw/master/docs/images/writer2.png
[writer3]: http://github.com/icco/coffee_shop/raw/master/docs/images/writer3.png

## 10.9.10

Waking up abnormally early, I decided it's time to get back to work. I'm going
to scrap pagination as a feature, for now. All it's really done is piss me off
and force me to focus on a technical problem that no one else really cares
about. So I'm going to make a branch marking where I'm departing from
pagination. The only real problem with this, is it reminds me that Kyle is far
smarter than I am. Whoo humbling moments...

## 10.16.10

 * <http://zetcode.com/tutorials/qtrubytutorial/introduction/>
 * <http://doc.trolltech.com/4.6/qcompleter.html>

## 10.19.10

Apparently I'm meeting with Dr. Turner tomorrow. In the last two months, I've
broken most of the features I had working around July. So now I'm pounding them
out and getting them working again. Heck I even added an application icon.

Some interesting research I came across, that I'll need to deal with later.

 * <http://www.erikveen.dds.nl/distributingrubyapplications/>

## 10.20.10

Attempted to get word count working... no luck. Also pasting from other programs does not work.

## 10.22.10

I met with Dr. Turner on Wednesday. He said I should make sure to bring up some
of the community challenges I have faced. The big one I am talking about is
pagination, and how the Qt users (both on SO and their forums) don't understand
the point of pagination while typing. I think it is very possible that using
ruby for this was a bad idea. Mainly because writing desktop applications in a
scripting language is not they easiest thing. 

I asked [this question][so-dist] on Stack Overflow, so maybe I can get some
help with distributing my app. 

[so-dist]: http://stackoverflow.com/questions/4000206/distributing-a-rubyqt-app

## 10.23.10

Yesterday I got the word count working, which I'm pretty stoked about. While
figuring out how to get it working, I think I figured out my biggest problem
with Qt: it assumes you can pass by reference, and that you have a reference to
every widget you ever created. This is so different to the design decisions
that web programming has, it's scary.

Also, I asked Jeannie to make me a [Splash Screen][splash-screen]. It'll be
sweet if she comes through. If not, I'll have to start drawing again, which
could burn out my user's eyes before the program finishes loading...

[splash-screen]: http://doc.trolltech.com/4.7/qsplashscreen.html

Things I have left to do:

 * Get the right menu disappearing
 * get my color picker working.
 * auto-detect screen size and scale appropriately

End of the day update: got the color picker kind of working, and the base for
the disappearing menu is working. I think.


## 10.26.10

Features I still want, in no particular order:

 * Add config saving
   * yaml?
 * tabs for multiple files
 * key commands
 * pasting from another app
   * this actually seems to be working...
 * styling of scrollbar
 * auto-hiding of the menu
 * intelligent sizing
   * also get the text area to be the appropriate size for paper. Can we look at the font? Do we need to?
 * Add the ability to change the font
   * serif, sans-serif, monospace
 * make the whole app look a little sexier. Maybe better default colors?
 * Maybe turn off auto saving?
   * Not sure how I feel about this...

## 11.7.10

Started messing with config saving. I sadly don't want to just dump the entire
GlobalSettings object into a file after encoding it with YAML, mainly because I
use it as a Singleton across the entire program to store all of my settings and
references to objects I have instantiated. 

An interesting caveat to how ruby's File.open works: you must send the file
name through File.expand_path if you want to turn ~/ into a users home dir. 

Also, Jeannie sent me some possible icon / theme ideas. You can check them out
[here](https://github.com/icco/coffee_shop/raw/master/docs/images/coffee-shop-icons-110710.jpg).

## 11.15.10

Finalized icon and screenshot. Turned off autosaving. I know, not a lot of progress, but meh.

TODO:

 * tabs for multiple files
 * key commands
   * C, V, P, O, S, W
 * styling of scrollbar
 * auto-hiding of the menu
 * intelligent sizing
   * also get the text area to be the appropriate size for paper. Can we look at the font? Do we need to?
 * Add the ability to change the font
   * serif, sans-serif, monospace
 * make the whole app look a little sexier. Maybe better default colors?

## 11.16.10

 Got Ctrl+s and Alt+F4 working

Current Functional requirement status

FR1: 85%

    * FR1.1: complete
    * FR1.2: 70%

FR2: complete

FR3: 75%

    * FR3.1: Done, kinda buggy
    * FR3.2: Done, Kinda buggy
    * FR3.3: the user should be able to select a font, from a limited selection of fonts.
    * FR3.4: Done

FR4: It must support find and replace.

FR5: Done

FR6: When the user clicks the print menu item, the dialog to print must be displayed.

## 11.29.10

Crap. Has it really been 13 days since I did any work on this?

Oh well. I got FR6 done. The problem is I need to get the global styling to be
better, because setting the BG color for * just doesn't work.
