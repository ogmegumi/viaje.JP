class RenameUserIdColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :user_id, :post_id
  end
end
