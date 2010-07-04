# Research Notes

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
old, and not under current maintainence. It seems like Qt is the way to go, so
I started playing around with it. I found a [great tutorial](http://www.darshancomputing.com/qt4-qtruby-tutorial/) 
and the Qt4 documentation is really good, heck I even figured out the full
screen stuff. Now on to getting a working prototype...
