class AddCommentScoreToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :comment_score, :decimal, precision: 5, scale: 3
  end
end
