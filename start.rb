require "rubygems"
require "sinatra"
require "./models/bookmark"

# This is Controlle!! This is Controlle!!
# This is Controlle!! This is Controlle!!
# This is Controlle!! This is Controlle!!

# ref: Gemfile

class MyApp < Sinatra::Base

  attr_accessor :tags

  if development?
    require 'sinatra/reloader'
  end

  set :haml, {format: :html5}

  def initialize
    @tags = ['ruby', 'perl', 'python', 'php']
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
end
