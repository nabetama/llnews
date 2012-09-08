# coding: utf-8
require "sequel"

DB = Sequel.connect('sqlite://test.db')

class Bookmark < Sequel::Model
end

