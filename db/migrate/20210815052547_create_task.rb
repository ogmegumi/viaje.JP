class CreateTask < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category, null: false
      t.text :belongings, null: false
      t.timestamps null: false
    end
  end
end
