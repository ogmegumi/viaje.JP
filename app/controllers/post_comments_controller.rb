class PostCommentsController < ApplicationController

  def create
   @post_comment = PostComment.create(post_comment_params)
    respond_to do |format|
      if @post_comment.save!
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js  # create.js.erbが呼び出される
      else
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = current_user.comments.find_by(post_id: @post.id)
    @post_comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
    # mergeメソッドでuser_idとpost_idをcommentテーブルのレコードに格納
  end

end
