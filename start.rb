# coding:utf-8
require "rubygems"
require "sinatra"
require "./models/bookmark"

# ref: Gemfile

class MyApp < Sinatra::Base

  attr_accessor :tags

  if development?
    require 'sinatra/reloader'
  end

  set :haml, {format: :html5}

  def initialize
    @tags = ['ruby', 'perl', 'python', 'php', 'sinatra', 'rails']
    super
  end

  get '/' do
    @data  = Bookmark.order_by(:bookmark_count.desc)
    haml :bookmarks
  end

  get '/:name' do |lang|
    "Hello, #{lang}"
    @data = Bookmark.order_by(:bookmark_count.desc).where(tag: lang)
    haml :bookmarks
  end

#  get '/style.css' do
#    content_type 'text/css', charset: 'utf-8'
#    sass :style
#  end
end

