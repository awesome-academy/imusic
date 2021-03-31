class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.integer :song_id

      t.timestamps
    end
  end
end
