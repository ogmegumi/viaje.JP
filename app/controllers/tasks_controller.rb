class TasksController < ApplicationController
  def show
    @tasks = Task.where(id: params[:id])
    @tasks1 = Task.where(category: "task1", id: params[:id])
    @tasks2 = Task.where(category: "task2", id: params[:id])
    @tasks3 = Task.where(category: "task3", id: params[:id])
    @tasks4 = Task.where(category: "task4", id: params[:id])
    @tasks5 = Task.where(category: "task5", id: params[:id])
    @tasks6 = Task.where(category: "task6", id: params[:id])
    @task = Task.new
    @user = current_user
    @user = @task.user_id
  end

  def create

    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
       flash[:notice] = "You have created Task successfully"
       redirect_to user_task_path(@task.user_id, @task.id)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       flash[:notice] = "You have updateted Task successfully"
       redirect_to user_task_path(@task.user_id, @task.id)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_task_path(@task.user_id, @task.id)
  end

  private
  def task_params
    params.require(:task).permit(:belongings, :category)
  end

end