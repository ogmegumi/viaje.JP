class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  def destroy
    @user = User.find(params[:relationship][:following_id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(5)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(5)
  end

end
