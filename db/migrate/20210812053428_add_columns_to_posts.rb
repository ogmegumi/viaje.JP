class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :start_time, :datetime
    add_column :posts, :finish_time, :datetime
  end
end
