class FavoritesController < ApplicationController
  before_action :authenticate_user!,except: [:top]


  def create
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.new(user_id: current_user.id)
    favorite.save
    #redirect_to posts_path 非同期通信
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    #redirect_to posts_path 非同期通信のため
  end
end
