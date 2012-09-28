# coding: utf-8
require "sequel"

DB = Sequel.connect('sqlite://test.db')

class Bookmark < Sequel::Model
  def before_create
    self.created_at ||= Time.now.strftime("%Y-%m-%d")
    super
  end

  def before_save
    self.updated_at = Time.now.strftime("%Y-%m-%d")
    super
  end
end

