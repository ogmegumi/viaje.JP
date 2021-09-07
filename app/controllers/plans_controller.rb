class PlansController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def index
    @posts = Post.find(params[:post_id])
    @plans = Plan.all
    @plan = @plan.plan_day_id
    # @days = @day.plans
  end

  def new
    @plan = Plan.new
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @plan = @plan.plan_day
    @plan = Plan.new(plan_params)
    # @plan.post_id = @post.id
    @plan.post_id = @post.id
    @plan.plan_day_id = @plan_day.id
    if @plan.save
      redirect_to post_path(@plan.post)
    else
      render :new
    end
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    redirect_to post_path(@plan.post_id)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to post_path(@plan.post_id)
  end

  private
  def plan_params
    params.require(:plan).permit(:start_time, :finish_time, :plan_content)
  end

end
