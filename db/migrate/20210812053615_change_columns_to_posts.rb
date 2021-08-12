class ChangeColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :start_time, :datetime, null: false
    change_column :posts, :finish_time, :datetime, null: false
  end
end
