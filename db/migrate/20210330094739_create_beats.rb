class CreateBeats < ActiveRecord::Migration[6.0]
  def change
    create_table :beats do |t|
      t.integer :song_id

      t.timestamps
    end
  end
end
