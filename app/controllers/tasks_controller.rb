class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: current_user.id)

    @tasks1 = Task.where(category: "task1", user_id: current_user.id)
    @tasks2 = Task.where(category: "task2", user_id: current_user.id)
    @tasks3 = Task.where(category: "task3", user_id: current_user.id)
    @tasks4 = Task.where(category: "task4", user_id: current_user.id)
    @tasks5 = Task.where(category: "task5", user_id: current_user.id)
    @tasks6 = Task.where(category: "task6", user_id: current_user.id)

    # @task_categories = Task.select(:category).distinct.pluck(:category)
    # カテゴリーモデルを作って、部分プレートで行うと完成度高くなる。カテゴリーをSQLからselectして取得

    @task = Task.new
    @user = current_user
    @user = @task.user_id
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:notice] = "You have created Task successfully"
      redirect_to user_tasks_path(@task.user_id)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "You have updateted Task successfully"
      redirect_to user_tasks_path(@task.user_id)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_path(@task.user_id)
  end

  private

  def task_params
    params.require(:task).permit(:belongings, :category)
  end
end
