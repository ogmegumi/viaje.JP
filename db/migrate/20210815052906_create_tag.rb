class CreateTag < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string     :name,              null: false
      t.timestamps null: false
    end
  end
end
