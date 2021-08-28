class RemoveCategoryFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :category, :string
  end
end
