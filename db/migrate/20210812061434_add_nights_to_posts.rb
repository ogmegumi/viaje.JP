class AddNightsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :nights, :integer
    change_column :posts, :nights, :integer, null: false
  end
end
