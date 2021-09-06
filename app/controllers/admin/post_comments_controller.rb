class Admin::PostCommentsController < ApplicationController
  
  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.find_by(post_id: @post.id)
    @post_comment.destroy
    # redirect_back(fallback_location: posts_path)
  end
end
