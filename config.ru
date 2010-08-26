#
# This is the rackup file. It has nothing to do with the program, but lets you
# deploy to heroku or some other web host to display the documentation. If you
# want to run it locally, install the ruby gems, and run docs/website.rb
#
require 'docs/website'
run Sinatra::Application

