# coding:utf-8
require "rubygems"
require "sinatra/base"
require "./models/bookmark"

class MyApp < Sinatra::Base

  attr_reader :tags

  if development?
    require 'sinatra/reloader'
  end

  set :haml, {format: :html5}

  def initialize
    @tags = ['ruby', 'perl', 'python', 'php', 'sinatra', 'rails']
    super
  end

  get '/' do
    cach_control
    @data  = Bookmark.order_by(:bookmark_count.desc)
    haml :bookmarks
  end

  get '/:name' do |lang|
    cach_control
    @data = Bookmark.order_by(:bookmark_count.desc).where(tag: lang)
    haml :bookmarks
  end

  # ページを1時間キャッシュする
  def cach_control
    expires 3600, :public, :must_revalidate
  end

  post '/target-date' do
    @data = 
      Bookmark.order_by(:bookmark_count.desc)
              .where(Sequel.like(:created_at, "#{params[:target_date]}%"))
              #.where(created_at: "params[:target_date]")
    haml :bookmarks
  end
end

