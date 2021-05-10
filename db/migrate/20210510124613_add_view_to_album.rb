class AddViewToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :view, :int
  end
end
