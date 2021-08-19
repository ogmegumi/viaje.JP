class CreatePostComment < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :post,    null: false, foreign_key: true
      t.text       :comment, null: false

      t.timestamps null: false
    end
  end
end