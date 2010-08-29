#!/usr/bin/ruby

# A simple app to display my senior project code.
# @author Nathaniel "Nat" Welch

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'
require 'RMagick'
require 'github/markup'
include Magick

get '/' do
   file = "README.md"
   md = GitHub::Markup.render(file, File.read(file))
   erb :index, :locals => { :readme => md }
end

get '/proposal' do
   title = "Senior Project Proposal"
   file = "docs/proposal.md"
   md = GitHub::Markup.render(file, File.read(file))
   erb :page, :locals => { :title => title, :content => md }
end

get '/schedule' do
   title = "Senior Project Schedule"
   file = "docs/schedule.txt"
   md = GitHub::Markup.render(file, File.read(file))
   content = "<pre>\n#{md}\n</pre>"
   erb :page, :locals => { :title => title, :content => content}
end

get '/notes' do
   title = "Senior Project Notes"
   file = "docs/notes.md"
   md = GitHub::Markup.render(file, File.read(file))
   erb :page, :locals => { :title => title, :content => md }
end

get '/spec' do
   title = "Senior Project Specification"
   file = "docs/spec.md"
   md = GitHub::Markup.render(file, File.read(file))
   erb :page, :locals => { :title => title, :content => md }
end

get '/ui' do
   title = "Senior Project UI Prototype"
   file = "docs/ui_prototype.md"
   md = GitHub::Markup.render(file, File.read(file))
   erb :page, :locals => { :title => title, :content => md }
end

get '/survey' do
   title = "Senior Project Questionnaire"
   file = "docs/Questionaire.md"
   md = GitHub::Markup.render(file, File.read(file))
   erb :page, :locals => { :title => title, :content => md }
end

get '/docs' do
   f = File.new "docs/coffee_shop.html" 
   erb :blank, :locals => { :content => f.read }
end

get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :style
end

get '/favicon.ico' do
   content_type 'image/x-ico'
   img = Magick::Image.read('docs/views/favicon.ico')[0]
   img.to_blob
end

