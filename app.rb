#!/usr/bin/ruby
# A simple app.

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'

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

get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :style
end

