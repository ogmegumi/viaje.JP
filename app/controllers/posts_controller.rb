class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @post_comments = PostComment.all
    @post_comment = PostComment.new
  end

  def new
   @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       redirect_to posts_path
    else
       render :new
    end
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
   @post.update(post_params)
   redirect_to posts_path(@posts)
  end

  private

  def post_params
    params.require(:post).permit(:destination, :days, :nights, :image, :content, :budget)
  end
end