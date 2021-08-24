class Admin::TasksController < ApplicationController
  def index
    @tasks = Task.all
    @tasks1 = Task.where(category: "task1")
    @tasks2 = Task.where(category: "task2")
    @tasks3 = Task.where(category: "task3")
    @tasks4 = Task.where(category: "task4")
    @tasks5 = Task.where(category: "task5")
    @tasks6 = Task.where(category: "task6")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to admin_tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to admin_tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to admin_tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:belongings, :category)
  end

end
