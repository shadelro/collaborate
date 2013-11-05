class AddCollaborationIdToSong < ActiveRecord::Migration
  def change
    add_column :songs, :collaboration_id, :integer
  end
end
