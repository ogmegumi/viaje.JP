class CreateTask < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :category, null: false
      t.text :brlongings, null: false
      t.timestamps null: false
    end
  end
end
