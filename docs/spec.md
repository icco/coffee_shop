# coffee_shop Specification

This is a very loose specification for the coffee_shop word processor. 

## Functional Requirements

In the following requirements, it refers to the application, coffee_shop.

**FR1**: It must allow the user to type into the application.
 
 * **FR1.1**: As the user types, text will appear onto the screen.
 * **FR1.2**: Certain keyboard shortcuts will cause the system to act in a predictable way. Such as CTRL+s will force the program to save the current working document.

**FR2**: It must be able to save and open the users work.

**FR3**: The work environment must be customisable.
 
 * **FR3.1**: the user should be able to select a background color.
 * **FR3.2**: the user should be able to select a font color.
 * **FR3.3**: the user should be able to select a font, from a limited selection of fonts.
 * **FR3.4**: these setting should be saved between sessions

**FR4**: It must support find and replace.

**FR5**: It must be able to display a word count.

**FR6**: When the user clicks the print menu item, the dialog to print must be displayed. 
 
## Non-Functional Requirements

**NFR1**: It must be Open Source

 * Suggested license is either [GPLv3](http://www.gnu.org/licenses/gpl.html) or [MIT](http://en.wikipedia.org/wiki/MIT_License). Basically it seems that the GPL requires if anyone is to ever use my code, they need to keep the code open source. The MIT license does not seem to require this. GPLv3 also requires that I provide a link to the code in the documentation if I distribute the code as a pre-compiled binary. Both licenses require that I distribute the license itself with the code and any pre-complied binaries.

**NFR2**: The language it is written in must be Open Source

 * Currently I am planning on using [Ruby](http://www.ruby-lang.org/en/) and [Shoes](http://github.com/shoes/shoes).

**NFR3**: It must run on Linux

 * It will not support all versions of Linux. I'm currently considering a build environment similar to Ubuntu 10.04.

**NFR4**: It must run full-screen.

**NFR5**: It should promote a distraction free work environment.

**NFR6**: It should be usable by people who work in various lighting environments (writing in a coffee shop, dark room, corporate environment)

**NFR7**: The format the work is saved in must be standards compliant format.

 * Suggestions would be either Markdown, plain-text, or both.

