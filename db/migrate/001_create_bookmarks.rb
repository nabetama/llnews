# create table bookmarks
require "sequel"

Sequel.migration do
  up do
    create_table(:bookmarks) do
      primary_key :id
      String :title, null: false
      String :url, null: false
      String :tag
      Integer :bookmark_count
    end
  end

  down do
    drop_table(:bookmarks)
  end
end

