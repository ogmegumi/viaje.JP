class CreateTagsRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_relationships do |t|
      t.timestamps null: false
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
    end
  end
end