class AddStartTimeToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :star_time, :datetime
    add_column :tasks, :finish_time, :datetime
  end
end
