# coding: utf-8
require "./crawler/crawler"
require "./models/bookmark"

db = DB[:bookmarks]
tags = ['ruby', 'perl', 'python', 'php', 'sinatra', 'rails']

tags.each do |tag|
  bookmarks = Crawler::Tag.new(users=3, tag=tag)
  bookmarks.scrape
  bookmarks.articles.each do |bookmark|
#    db.insert(
#      title: bookmark[:title],
#      url:   bookmark[:url],
#      tag:   bookmark[:tag],
#      bookmark_count: [bookmark:bookmark_count]
#    )
    puts bookmark[:title]
    puts bookmark[:link_url]
    puts tag
    puts bookmark[:users]
  end
end

