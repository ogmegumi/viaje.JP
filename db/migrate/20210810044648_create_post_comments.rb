class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer  :user_id, foreign_key: true, null: false
      t.integer  :post_id, foreign_key: true, null: false
      t.integer  :task_id, foreign_key: true, null: false
      t.text     :comment,                    null: false
      t.timestamps
    end
  end
end
