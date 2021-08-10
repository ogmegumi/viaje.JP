class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string   :name, null: false
      t.integer  :tags_relationship_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
