class ChangeDestinationToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :destination, :string, null: false
  end
end
