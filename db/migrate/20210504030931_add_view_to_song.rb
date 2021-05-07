class AddViewToSong < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :view, :int
  end
end
