class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @post_comments = PostComment.all
    @tags = Tag.all
    @post_comment = PostComment.new
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def show
    @posts = Post.where(user_id: current_user.id)
    @post = Post.find(params[:id])
    @user = @post.user
    @plan_day = PlanDay.new
    @plans = @plan_day.plans.build
    @plan_days = @post.plan_days
    @tags = @post.tags
    # @post = @post.plan
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
  end

  def post_show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:name].split(nil)
    if @post.save
       @post.save_tag(tag_list)
       flash[:notice] = "You have created successfully."
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
   tag_list = params[:post][:name].split(nil)
    if @post.save
       @post.save_tag(tag_list)
       flash[:notice] = "You have updateed successfully."
       redirect_to posts_path(@posts)
    end
  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.all  #クリックしたタグに紐付けられた投稿を全て表示
  end

  private

  def post_params
    params.require(:post).permit(:destination, :days, :nights, :image, :content, :budget)
  end

end