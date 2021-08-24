class PlansController < ApplicationController

  def index
    @post = Post.find(params[:id])
    @plans = Plan.where(post_id: params[:id])
    @plan = Plan.new
    @post_comments = PostComment.all
    @post_comment = PostComment.new
  end

  def new
    @plan = Plan.new
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path(id: @plan.post_id)
    else
      render :new
    end
  end
  
  # def create
  #   @day = Day.new(day_params)
  #   if @day.save
  #     redirect_to plans_path(id: @day.post_id)
  #   else
  #     render :new
  #   end
  # end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    redirect_to plans_path(id: @plan.post_id)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path(id: @plan.post_id)
  end

  private
  def plan_params
    params.require(:plan).permit(:start_time, :finish_time, :plan_content, :post_id)
  end

end
