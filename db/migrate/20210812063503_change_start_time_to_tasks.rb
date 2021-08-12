class ChangeStartTimeToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :star_time, :datetime, null: false
    change_column :tasks, :finish_time, :datetime, null: false
  end
end
