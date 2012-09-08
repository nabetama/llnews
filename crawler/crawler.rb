# coding: utf-8
require "rubygems"
require "bundler/setup"

require "nokogiri"
require "open-uri"
require "./models/bookmark"

module Crawler
  class Tag
    attr_accessor :users, :tag, :articles

    def initialize(users=3, tag="ruby")
      @users = users
      @tag = tag
      @uri = "http://b.hatena.ne.jp/search/tag?q=#{@tag}"
      @bookmark_xpath = '//*[@id="search-result-lists"]/ul/li'
      @articles = []
    end

    def scrape
      @doc = Nokogiri::HTML(open(@uri))

      @doc.search(@bookmark_xpath).each do |entry|
        # 記事のタイトル
        title = entry.search("h3/a").inner_text

        # 記事のブクマ数
        users = entry.search('span[@class="users"]/*/a').inner_text
        users = users.match(/(\d+)/)

        # 記事のリンクURL
        link_url = entry.search('h3/a/@href').inner_text

        @articles << { title: title,
          users: users,
          link_url: link_url}
      end
    end
  end
end

__END__

bookmarks = Crawler::Tag.new(users=5, tag='perl')
bookmarks.scrape
bookmarks.articles.each do |bookmark|
  puts bookmark[:title]
  puts bookmark[:users]
  puts bookmark[:link_url]
  puts "\n"
end
