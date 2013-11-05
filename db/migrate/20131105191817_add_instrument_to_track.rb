class AddInstrumentToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :instrument, :string
  end
end
