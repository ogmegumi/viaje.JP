class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.integer  :user_id, foreign_key: true, null: false
      t.text     :memo,                       null: false
      t.timestamps
    end
  end
end
