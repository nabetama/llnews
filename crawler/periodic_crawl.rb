# coding: utf-8
require "logger"
require "./crawler/crawler"
require "./models/bookmark"

log = Logger.new('./crawler/bookmarks.log')
log.level = Logger::INFO
tags = ['ruby', 'perl', 'python', 'php', 'sinatra', 'rails']

tags.each do |tag|
  bookmarks = Crawler::Tag.new(users=3, tag=tag)
  bookmarks.scrape
  bookmarks.articles.each do |bookmark|

    row_count = Bookmark.where(title: bookmark[:title], tag: tag, url:bookmark[:link_url]).count
    log.info "#{row_count}件のレコードを見つけました"
    if row_count.eql? 0
      Bookmark.create(
        title:          bookmark[:title],
        url:            bookmark[:link_url],
        tag:            tag,
        bookmark_count: bookmark[:users].to_s.to_i
      )
      log.info "created: 『#{bookmark[:title]}』 tag: #{tag} #{bookmark[:users]}users"
    else
      Bookmark.where(
        title:          bookmark[:title],
        url:            bookmark[:link_url],
        tag:            tag,
      ).update(
        bookmark_count: bookmark[:users].to_s.to_i
      )
      log.info "updated: 『#{bookmark[:title]}』 tag: #{tag} #{bookmark[:users]}users"
    end
  end
end

