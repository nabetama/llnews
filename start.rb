require "rubygems"
require "sinatra"
require "./models/bookmark"

# This is Controlle!! This is Controlle!!
# This is Controlle!! This is Controlle!!
# This is Controlle!! This is Controlle!!

# ref: Gemfile
if development?
  require 'sinatra/reloader'
end

set :haml, {format: :html5}

get '/' do
  @rubys    = Bookmark.order_by(:id.desc).where(tag: "ruby")
  @rails    = Bookmark.order_by(:id.desc).where(tag: "rails")
  @sinatras = Bookmark.order_by(:id.desc).where(tag: "sinatra")
  @perls    = Bookmark.order_by(:id.desc).where(tag: "perl")
  @pythons  = Bookmark.order_by(:id.desc).where(tag: "python")
  @phps     = Bookmark.order_by(:id.desc).where(tag: "phps")
  @title = 'Light Weight Language News'
  @tags = ['ruby', 'perl', 'python', 'php']
  haml :index
end

