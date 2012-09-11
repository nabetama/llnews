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
  @bookmarks = Bookmark.order_by(:id.desc)
  haml :index
end
