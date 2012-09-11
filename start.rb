require "rubygems"
require "sinatra"
require "./models/bookmark"

set :haml, {format: :html5}

get '/' do
  @bookmarks = Bookmark.order_by(:id.desc).where(tag: 'ruby')
  haml :index
end
