class AddTimeSignatureToSong < ActiveRecord::Migration
  def change
    add_column :songs, :time_signature, :string
  end
end
