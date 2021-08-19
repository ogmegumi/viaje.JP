class CreateRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :followed_id, null: false
      t.integer :follower_id, null: false
      t.timestamps null: false
    end
  end
end
