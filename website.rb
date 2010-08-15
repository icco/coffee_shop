#!/usr/bin/ruby

# A simple app to display my senior project code.
# @author Nathaniel "Nat" Welch

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'
require 'RMagick'
include Magick

get '/' do
   md = RDiscount.new(File.read("README.md"), :smart).to_html
   erb :index, :locals => { :readme => md }
end

get '/proposal' do
   title = "Senior Project Proposal"
   md = RDiscount.new(File.read("docs/proposal.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
end

get '/schedule' do
   title = "Senior Project Schedule"
   content = "<pre>\n#{File.read("docs/schedule.txt")}\n</pre>"
   erb :page, :locals => { :title => title, :content => content }
end

get '/notes' do
   title = "Senior Project Notes"
   md = RDiscount.new(File.read("docs/notes.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
end

get '/spec' do
   title = "Senior Project Specification"
   md = RDiscount.new(File.read("docs/spec.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
end

get '/ui' do
   title = "Senior Project UI Prototype"
   md = RDiscount.new(File.read("docs/ui_prototype.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
end

get '/survey' do
   title = "Senior Project Questionnaire"
   md = RDiscount.new(File.read("docs/Questionaire.md"), :smart).to_html
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
   img = Magick::Image.read('./views/favicon.ico')[0]
   img.to_blob
end

