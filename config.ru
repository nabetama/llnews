require 'rubygems'
require 'bundler'

Bundler.require

require './start'

MyApp.run! host: 'localhost', port: 9292
