class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts = Post.page(params[:page]).per(8)
    @posts = Post.where(status: :published).order("created_at DESC").page(params[:page]).per(8)
    @memos = @user.memos
    @tasks = @user.tasks
  end

  def confirm
    @user = User.find(params[:id])
    @posts = @user.posts.where(status: :draft).order('created_at DESC').page(params[:page]).per(20)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user # ひとしくない時！＝
      redirect_to user_path(current_user) # before actionでチェックしてるからelse不要
    end
  end
end
