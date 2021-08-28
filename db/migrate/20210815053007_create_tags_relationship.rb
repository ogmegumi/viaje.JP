class CreateTagsRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_relationships do |t|
      t.timestamps null: false
      t.bigint :post, null: false
      t.bigint :tag, null: false
    end
    add_reference :tags_relationships, :post, foreign_key: true
    add_reference :tags_relationships, :tag, foreign_key: true
  end
end
