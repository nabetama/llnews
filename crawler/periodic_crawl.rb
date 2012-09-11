# coding: utf-8
require "./crawler/crawler"
require "./models/bookmark"

table = DB[:bookmarks]
tags = ['ruby', 'perl', 'python', 'php', 'sinatra', 'rails']

tags.each do |tag|
  bookmarks = Crawler::Tag.new(users=3, tag=tag)
  bookmarks.scrape
  bookmarks.articles.each do |bookmark|
    table.insert(
      title:          bookmark[:title],
      url:            bookmark[:link_url],
      tag:            bookmark[:tag],
      bookmark_count: bookmark[:users].to_s.to_i
    )
  end
end

