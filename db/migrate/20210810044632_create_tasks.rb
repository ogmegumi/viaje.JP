class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer  :user_id, foreign_key: true, null: false
      t.string   :category,     null: false
      t.text     :plan_content, null: false
      t.timestamps
    end
  end
end
