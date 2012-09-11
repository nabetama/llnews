require "rubygems"
require "sinatra"
require "./models/bookmark"

if developement
  require 'sinatra/reloader'
end

set :haml, {format: :html5}

get '/' do
  @bookmarks = Bookmark.order_by(:id.desc).where(tag: 'ruby')
  haml :index
end
