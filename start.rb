require "rubygems"
require "sinatra"
require "./models/bookmark"

get '/' do
  Bookmark.new(
    title: 'nabetama.com',
    url:   'http://nabetama.com',
    tag:   'test',
    bookmark_count: 42
  )

  @bookmarks = Bookmark.order_by(:id.desc)
  slim :index
end
