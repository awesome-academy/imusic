class CreateFavoriteLists < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_lists do |t|
      t.integer :user_id
      t.text :title

      t.timestamps
    end
  end
end
