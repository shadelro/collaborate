class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :author
      t.string :instrument
      t.string :lyrics
      t.integer :song_id

      t.timestamps
    end
  end
end
