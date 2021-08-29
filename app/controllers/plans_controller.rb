class PlansController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  # def index /////post_showに移行のため削除
  #   @post = Post.find(params[:id])
  #   @plans = Plan.where(post_id: params[:id])
  #   # @days = PlanDay.find(id: @plan.plan_days_id)
  #   @plan = Plan.new
  #   @post_comments = PostComment.all
  #   @post_comment = PostComment.new
  #   # @days = @day.plans
  # end

  # def new
  #   @plan = Plan.new
  # end

  # def edit
  #   # @plan = Plan.find(params[:id])
  # end

  # def create
  #   @post = Post.find(params[:post_id])
  #   @plan_day = PlanDay.new(plan_params)
  #   # @plan.post_id = @post.id
  #   @plan.plan_days_id = @plan_days.id
  #   if @plan.save
  #     redirect_to post_path(@plan.post)
  #   else
  #     render :new
  #   end
  # end


  # def update
  #   @plan = Plan.find(params[:id])
  #   @plan.update(plan_params)
  #   redirect_to post_path(@plan.post_id)
  # end

  # def destroy
  #   @plan = Plan.find(params[:id])
  #   @plan.destroy
  #   redirect_to post_path(@plan.post_id)
  # end

  # private
  # def plan_params
  #   params.require(:plan).permit(:start_time, :finish_time, :plan_content, :days)
  # end

end
