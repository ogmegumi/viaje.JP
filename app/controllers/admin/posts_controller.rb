class Admin::PostsController < ApplicationController


  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(12)
    @user = current_user
    @post_comments = PostComment.all
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.where(user_id: @user)
    @user = @post.user
    @tags = @post.tags
    # @post = @post.plan
    @post_comments = @post.post_comments
  end


  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to posts_path
  end

  def edit
   @post = Post.find(params[:id])
  end

  def update
   @post = Post.find(params[:id])
    if   @post.update(post_params)
         flash[:notice] = "You have updated successfully."
         redirect_to admin_posts_path
    else flash[:alert] = "投稿に失敗しました"
         render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:destination, :days, :nights, :image, :content, :budget, :status)
  end

end

