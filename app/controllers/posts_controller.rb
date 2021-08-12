class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  def search
  end

  private

  def post_params
    params.require(:post).permit(:destination, :days, :nights, :image, :content, :budget)
  end

end
