class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
