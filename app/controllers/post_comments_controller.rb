class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.user_id = current_user.id
    @post_comment.save
      # render 'error'  # app/views/post_comments/error.js.erbを参照する ※要件外

    # app/views/post_comments/create.js.erbを参照する
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = current_user.comments.find_by(post_id: @post.id)
    @post_comment.destroy
    # redirect_back(fallback_location: root_path)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)#merge(user_id: current_user.id, post_id: params[:post_id])
    # mergeメソッドでuser_idとpost_idをcommentテーブルのレコードに格納
  end

end
