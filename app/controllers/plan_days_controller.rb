class PlanDaysController < ApplicationController

  # def index  !!renderへ変更!!
  #   @plan_days = PlanDay.all
  #   @plan = Plan.all
  #   @post = Post.all
  # end

  def new
    @post = Post.find(params[:post_id])
    @plan_day = PlanDay.new
    @plans = @plan_day.plans.build
  end

  def edit
    @plan_day = PlanDay.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @plan_day = PlanDay.new(day_params)
    @plan_day.post_id = @post.id
    if @plan_day.save
      redirect_to post_path(@plan_day.post_id)
    else
      render :new
    end
  end

  def destroy
    @plan_day = PlanDay.find(params[:id])
    @plan.destroy
    redirect_to post_path(@post.plan_day)
  end

  def update
    @plan_day = PlanDay.find(params[:id])
    @plan.update(plan_params)
    redirect_to post_path(@post.plan_day)
  end

  private
  def day_params
    params.require(:plan_day).permit(:days, [plans_attributes: [:start_time, :finish_time, :plan_content]])
  end

end