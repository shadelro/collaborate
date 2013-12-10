class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :key
      t.string :time_signature
      t.string :tempo
      t.integer :collaboration_id

      t.timestamps
    end
  end
end
