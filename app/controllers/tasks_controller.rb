class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @tasks1 = Task.where(category: "task1")
    @tasks2 = Task.where(category: "task2")
    @tasks3 = Task.where(category: "task3")
    @tasks4 = Task.where(category: "task4")
    @tasks5 = Task.where(category: "task5")
    @tasks6 = Task.where(category: "task6")
    @task = Task.new
    @user = current_user
    @user = @task.user
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
       flash[:notice] = "You have created Task successfully"
       redirect_to user_tasks_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       flash[:notice] = "You have updateted Task successfully"
       redirect_to tasks_path(@task)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:belongings, :category)
  end

end