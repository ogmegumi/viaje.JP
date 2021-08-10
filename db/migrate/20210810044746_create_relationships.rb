class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :user_id, foreign_key: true, null: false
      t.integer :post_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
