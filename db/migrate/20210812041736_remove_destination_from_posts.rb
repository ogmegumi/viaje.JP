class RemoveDestinationFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :destination, :string
  end
end
