class CreateRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
