class CreateTagsRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_relationships do |t|
      t.timestamps null: false
      t.bigint :post, null: false
      t.bigint :tag, null: false
    end
    add_foreign_key :tags_relationships, :post
    add_foreign_key :tags_relationships, :tag
  end
end
