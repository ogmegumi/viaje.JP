class CreateRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follower, foreign_key: { to_table: :users }
      t.references :following, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
