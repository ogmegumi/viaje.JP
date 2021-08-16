class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user,     null: false, foreign_key: true
      t.text       :content,     null: false
      t.integer    :budget ,     null: false
      t.string     :image_id,    null: false
      t.string     :destination, null: false
      t.integer    :days,        null: false
      t.integer    :nights,      null: false
      t.timestamps null: false
    end
  end
end
