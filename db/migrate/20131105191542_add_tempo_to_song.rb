class AddTempoToSong < ActiveRecord::Migration
  def change
    add_column :songs, :tempo, :string
  end
end
