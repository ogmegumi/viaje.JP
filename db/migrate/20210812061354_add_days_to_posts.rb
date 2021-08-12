class AddDaysToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :days, :integer
    change_column :posts, :days, :integer, null: false
  end
end
