#!/usr/bin/ruby1.8
# An app for displaying one's resume

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'

get '/' do
   erb :index
end

get '/proposal' do
   title = "Senior Project Proposal"
   md = RDiscount.new(File.read("proposal.md"), :smart).to_html
   erb :page, :locals => { :title => title, :resume => md }
end

get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :style
end

