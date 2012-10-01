# coding: utf-8
require "./crawler/crawler"
require "./models/bookmark"

tags = ['ruby', 'perl', 'python', 'php', 'sinatra', 'rails']

tags.each do |tag|
  bookmarks = Crawler::Tag.new(users=3, tag=tag)
  bookmarks.scrape
  bookmarks.articles.each do |bookmark|

    row_count = Bookmark.where(title: bookmark[:title], tag: tag, url:bookmark[:link_url]).count
    puts "#{row_count}件のレコードを見つけました"
    if row_count.eql? 0
      Bookmark.create(
        title:          bookmark[:title],
        url:            bookmark[:link_url],
        tag:            tag,
        bookmark_count: bookmark[:users].to_s.to_i
      )
      puts "created: #{bookmark[:title]}: #{bookmark[:tag]}: #{bookmark[:bookmark_count]}"
    else
      Bookmark.where(
        title:          bookmark[:title],
        url:            bookmark[:link_url],
        tag:            tag,
      ).update(
        bookmark_count: bookmark[:users].to_s.to_i
      )
      puts "updated: #{bookmark[:title]}: #{bookmark[:tag]}: #{bookmark[:bookmark_count]}"
    end
  end
end

