class RemoveStartTimeFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :start_time, :datetime
    remove_column :posts, :finish_time, :datetime
  end
end
