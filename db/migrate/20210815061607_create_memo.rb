class CreateMemo < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.timestamps null: false
      t.text :memo, null: false
    end
  end
end
