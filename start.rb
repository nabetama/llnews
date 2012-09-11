require "rubygems"
require "sinatra"
require "./models/bookmark"

set :haml, {format: :html5}

get '/' do
#  bookmarks = DB[:bookmarks]
#  bookmarks.insert(
#    title: 'nabetama.com',
#    url:   'http://nabetama.com',
#    tag:   'test',
#    bookmark_count: 42
#  )

  @bookmarks = Bookmark.order_by(:id.desc)
  haml :index
end
