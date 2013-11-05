class CreateTableCollaborationsUsers < ActiveRecord::Migration
  def up
    create_table :collaborations_users do |t|
      t.integer :collaboration_id
      t.integer :user_id
    end
  end

  def down
    drop_table :collaborations_users
  end
end
