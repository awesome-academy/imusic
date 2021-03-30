class CreateArtistSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_songs do |t|
      t.integer :artist_id
      t.integer :song_id

      t.timestamps
    end
  end
end
