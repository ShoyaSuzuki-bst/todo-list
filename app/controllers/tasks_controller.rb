class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :edit, :delete]
  def index
    @tasks = Task.all
  end

  def show() end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to @task, notice: 'success'
    else
      render :new
    end
  end

  def edit() end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'success'
    else
      render :edit
    end
  end

  def destroy() end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :detail)
  end
end
