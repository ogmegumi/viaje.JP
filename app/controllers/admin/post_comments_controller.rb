class Admin::PostCommentsController < ApplicationController
  
  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.find_by(post_id: @post.id)
    if @post_comment.destroy
       flash[:notice] = "削除しました"
    end
    # redirect_back(fallback_location: posts_path)
  end
end
