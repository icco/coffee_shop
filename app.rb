#!/usr/bin/ruby
# A simple app.

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
   md = RDiscount.new(File.read("proposal.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
end

get '/schedule' do
   title = "Senior Project Schedule"
   content = "<pre>\n#{File.read("schedule.txt")}\n</pre>"
   erb :page, :locals => { :title => title, :content => content }
end

get '/notes' do
   title = "Senior Project Notes"
   md = RDiscount.new(File.read("notes.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
end

get '/spec' do
   title = "Senior Project Specification"
   md = RDiscount.new(File.read("spec.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
end


get '/survey' do
   title = "Senior Project Questionnaire"
   md = RDiscount.new(File.read("Questionaire.md"), :smart).to_html
   erb :page, :locals => { :title => title, :content => md }
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

