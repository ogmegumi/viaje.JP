class PostCommentsController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.user_id = current_user.id
    @post_comment.comment_score = Language.get_data(post_comment_params[:comment])
    @post_comment.save
    # redirect_to posts_path
    # app/views/post_comments/create.js.erbを参照する
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.find_by(post_id: @post.id)
    @post_comment.destroy
    # redirect_back(fallback_location: posts_path)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)#xxx merge(user_id: current_user.id, post_id: params[:post_id]) xxx
    # id付与させることでmerge不要とするxxx mergeメソッドでuser_idとpost_idをcommentテーブルのレコードに格納をxxx
  end

end
