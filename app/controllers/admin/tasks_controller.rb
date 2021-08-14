class Admin::TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_tp admin_tasks_path
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private
   def task_params
     params.require(:task).permit(:category, :plan_content, :post_id)
   end
end
