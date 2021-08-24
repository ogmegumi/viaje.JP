class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @post_comments = PostComment.all
    @post_comment = PostComment.new
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @plan_day = PlanDay.new
    @user = @post.user
    @plan_days = @post.plan_days
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
    if @post.save
       flash[:notice] = "You have created successfully."
       redirect_to posts_path
    else
       render :new
    end
    # もしpostでplanも同時に場合のコード
    # @post = Post.new(post_params)
    # if @post.save
    #   @plan = Plan.new(plan_params)
    #   @plan.post_id = @post.id
    #   if @plans.save
    #     redirect_to posts_path
    #   else
    #     render :new
    #   end
    # end
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
   if @post.update(post_params)
     flash[:notice] = "You have updated successfully."
     redirect_to posts_path(@posts)
   end
  end

  private

  def post_params
    params.require(:post).permit(:destination, :days, :nights, :image, :content, :budget)
  end

  # def plan_params
  #   params.require(:plan).permit(~~~~~)
  # end
end